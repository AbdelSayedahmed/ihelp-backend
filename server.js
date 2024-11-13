// DEPENDENCIES
const app = require("./app.js");
const http = require("http");
const { initializeSocket } = require("./socket.js");

// CONFIGURATION
require("dotenv").config();
const PORT = process.env.PORT;

const server = http.createServer(app);
const io = initializeSocket(server);
// LISTEN
server.listen(PORT, "0.0.0.0", () =>
	console.log(`Listening on port http://0.0.0.0:${PORT}`)
);
