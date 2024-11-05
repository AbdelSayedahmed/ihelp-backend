const express = require("express");
const volunteerWebpp = express.Router();
const { verifyToken } = require("../middleware/auth.middleware");

const {
	getOpenRequests,
	getRequestDetails,
	getVolunteerProfile,
	getLeaderboardVolunteers,
	commitToTask,
	unCommitToTask,
	getVolunteerIdByUid,
	getTasksByVolunteerId,
	getQuest,
} = require("../queries/volunteersWebappQueries");

volunteerWebpp.get("/open-requests", async (req, res) => {
	try {
		const openRequests = await getOpenRequests();
		res.status(200).json(openRequests);
	} catch (error) {
		res.status(500).json({ message: error.message, error });
	}
});

volunteerWebpp.get("/open-requests/:id", async (req, res) => {
	try {
		const requestDetails = await getRequestDetails(req.params.id);
		res.status(200).json(requestDetails);
	} catch (error) {
		res.status(500).json({ message: error.message, error });
	}
});

volunteerWebpp.get("/profile", async (req, res) => {
	try {
		// const uid = req.user.uid;
		const uid = "bWDLGo3svlbYEDGc2qfXzWnwBdK2";
		const volunteer = await getVolunteerIdByUid(uid);
		if (!volunteer) {
			return res.status(404).json({ message: "Volunteer not found" });
		}
		const volunteerProfile = await getVolunteerProfile(volunteer.id);
		if (!volunteerProfile) {
			return res.status(404).json({ message: "Volunteer not found" });
		}

		res.status(200).json(volunteerProfile);
	} catch (error) {
		res.status(500).json({ message: error.message, error });
	}
});
volunteerWebpp.get("/leaderboard", async (req, res) => {
	try {
		const leaderboardVolunteers = await getLeaderboardVolunteers();
		res.status(200).json(leaderboardVolunteers);
	} catch (error) {
		res.status(500).json({ message: error.message, error });
	}
});
volunteerWebpp.post("/tasks/:taskId/commit", async (req, res) => {
	try {
		const { taskId } = req.params;
		// const uid = req.user.uid;
		const uid = "bWDLGo3svlbYEDGc2qfXzWnwBdK2";
		const volunteer = await getVolunteerIdByUid(uid);
		if (!volunteer) {
			return res.status(404).json({ message: "Volunteer not found" });
		}

		const result = await commitToTask(volunteer.id, taskId);
		res.status(200).json(result);
	} catch (error) {
		res.status(500).json({ message: error.message });
	}
});

volunteerWebpp.post("/tasks/:taskId/uncommit", async (req, res) => {
	try {
		const { taskId } = req.params;
		// const uid = req.user.uid;
		const uid = "bWDLGo3svlbYEDGc2qfXzWnwBdK2";

		const volunteer = await getVolunteerIdByUid(uid);
		if (!volunteer) {
			return res.status(404).json({ message: "Volunteer not found" });
		}

		const result = await unCommitToTask(volunteer.id, taskId);
		res.status(200).json(result);
	} catch (error) {
		res.status(500).json({ message: error.message });
	}
});

volunteerWebpp.get("/volunteerTasks", async (req, res) => {
	try {
		// const uid = req.user.uid;
		const uid = "bWDLGo3svlbYEDGc2qfXzWnwBdK2";
		const volunteer = await getVolunteerIdByUid(uid);
		if (!volunteer) {
			return res.status(404).json({ message: "Volunteer not found" });
		}
		const tasks = await getTasksByVolunteerId(volunteer.id);
		res.status(200).json(tasks);
	} catch (error) {
		res.status(500).json({ message: error.message });
	}
});

volunteerWebpp.get("/quest/tasks/:id", async (req, res) => {
	try {
		const { id } = req.params;
		// const uid = req.user.uid;
		const uid = "bWDLGo3svlbYEDGc2qfXzWnwBdK2";
		const volunteer = await getVolunteerIdByUid(uid);
		if (!volunteer) {
			return res.status(404).json({ message: "Volunteer not found" });
		}
		const quest = await getQuest(id, volunteer.id);
		res.status(200).json(quest);
	} catch (error) {
		res.status(500).json({ message: error.message ,error});
	}
});

module.exports = volunteerWebpp;
