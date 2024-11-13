const { Server } = require("socket.io");

let io;

const initializeSocket = (server) => {
	io = new Server(server, {
		cors: {
			origin: [
				"http://localhost:5173",
				"https://deploy-preview-31--ihelp-org.netlify.app",
			],
			methods: ["GET", "POST", "PUT", "DELETE"],
		},
	});

	io.on("connection", (socket) => {
		console.log("Client connected:", socket.id);

		socket.on("taskCommitted", (data) => {
			console.log(`Task committed by volunteer ${data.volunteerId}`);
			// Broadcast to organization room
			io.emit("requestsUpdate", {
				requestId: data.requestId,
				taskId: data.taskId,
				volunteerId: data.volunteerId,
				type: "TASK_COMMITTED",
			});
		});

		socket.on("disconnect", () => {
			console.log("Client disconnected:", socket.id);
		});
	});

	return io;
};

const getIO = () => {
	if (!io) {
		throw new Error("Socket.io not initialized");
	}
	return io;
};

module.exports = { initializeSocket, getIO };
