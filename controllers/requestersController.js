const express = require("express");
const requesters = express.Router();
const {
  getAllRequesters,
  getRequesterById,
  createRequester,
  updateRequester,
  deleteRequester,
} = require("../queries/requestersQueries");

requesters.get("/", async (req, res) => {
  try {
    const uid = req.user.uid;
    const allRequesters = await getAllRequesters(uid);
    res.status(200).json(allRequesters);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requesters.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const requester = await getRequesterById(id);
    if (requester) {
      res.status(200).json(requester);
    } else {
      res.status(404).json({ error: "Requester not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requesters.post("/", async (req, res) => {
  const { name, email } = req.body;
  const uid = req.user.uid;

  if (!name || !email) return res.status(400).json({ error: "Missing required fields" });

  try {
    const newRequester = await createRequester(uid, req.body);
    res.status(201).json(newRequester);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requesters.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { name, email } = req.body;

  if (!name || !email) return res.status(400).json({ error: "Missing required fields" });

  try {
    const updatedRequester = await updateRequester(id, req.body);
    if (updatedRequester) {
      res.status(200).json(updatedRequester);
    } else {
      res.status(404).json({ error: "Requester not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requesters.delete("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const deletedRequester = await deleteRequester(id);
    if (deletedRequester) {
      res.status(200).json(deletedRequester);
    } else {
      res.status(404).json({ error: "Requester not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = requesters;
