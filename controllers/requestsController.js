const express = require("express");
const requests = express.Router();
const {
	getAllRequests,
	getOpenRequests,
	getRequestById,
	createRequest,
	updateRequest,
	deleteRequest,
} = require("../queries/requestsQueries");

requests.get("/", async (req, res) => {
	try {
		// const uid = req.user.uid;
		const uid = "bxGXTPH6UXeRvYcSODa14QjmXoL2";
		const allRequests = await getAllRequests(uid);
		res.status(200).json(allRequests);
	} catch (error) {
		res.status(500).json({ error, msg: error.message });
	}
});

//volunteers
requests.get("/open", async (req, res) => {
	try {
		const uid = req.user.uid;
		const openRequests = await getOpenRequests(uid);
		res.status(200).json(openRequests);
	} catch (error) {
		res.status(500).json({ error: "Server error" });
	}
});

requests.get("/:id", async (req, res) => {
	const { id } = req.params;
	const { id } = req.params;

	try {
		const request = await getRequestById(id);
		if (request) {
			res.status(200).json(request);
		} else {
			res.status(404).json({ error: "Request not found" });
		}
	} catch (error) {
		res.status(500).json({ error: "Server error" });
	}
	try {
		const request = await getRequestById(id);
		if (request) {
			res.status(200).json(request);
		} else {
			res.status(404).json({ error: "Request not found" });
		}
	} catch (error) {
		res.status(500).json({ error: "Server error" });
	}
});

requests.post("/", async (req, res) => {
	try {
		// const uid = req.user.uid;
		const uid = "bxGXTPH6UXeRvYcSODa14QjmXoL2";
		const result = await createRequest(uid, req.body);
		res.status(201).json(result);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Server error" });
	}
});

requests.put("/:id", async (req, res) => {
	try {
		const { id } = req.params;
		const result = await updateRequest(id, req.body);
		res.status(200).json(result);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Server error" });
	}
	try {
		const { id } = req.params;
		const result = await updateRequest(id, req.body);
		res.status(200).json(result);
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Server error" });
	}
});

requests.delete("/:id", async (req, res) => {
	const { id } = req.params;
	const { id } = req.params;

	try {
		const deletedRequest = await deleteRequest(id);
		if (deletedRequest) {
			res.status(200).json(deletedRequest);
		} else {
			res.status(404).json({ error: "Request not found" });
		}
	} catch (error) {
		res.status(500).json({ error: "Server error" });
	}
	try {
		const deletedRequest = await deleteRequest(id);
		if (deletedRequest) {
			res.status(200).json(deletedRequest);
		} else {
			res.status(404).json({ error: "Request not found" });
		}
	} catch (error) {
		res.status(500).json({ error: "Server error" });
	}
});

module.exports = requests;
