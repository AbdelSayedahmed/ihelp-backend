const express = require("express");
const requestTasks = express.Router();
const {
  getAllRequestTasks,
  getRequestTaskById,
  createRequestTask,
  updateRequestTask,
  deleteRequestTask,
} = require("../queries/requestTasksQueries");

requestTasks.get("/", async (req, res) => {
  try {
    const allRequestTasks = await getAllRequestTasks();
    res.status(200).json(allRequestTasks);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requestTasks.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const requestTask = await getRequestTaskById(id);
    if (requestTask) {
      res.status(200).json(requestTask);
    } else {
      res.status(404).json({ error: "Task not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requestTasks.post("/", async (req, res) => {
  const { title, description } = req.body;

  if (!title || !description)
    return res.status(400).json({ error: "Missing required fields" });

  try {
    const newRequestTask = await createRequestTask(req.body);
    res.status(201).json(newRequestTask);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requestTasks.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { title, description } = req.body;

  if (!title || !description)
    return res.status(400).json({ error: "Missing required fields" });

  try {
    const updatedRequestTask = await updateRequestTask(id, req.body);
    if (updatedRequestTask) {
      res.status(200).json(updatedRequestTask);
    } else {
      res.status(404).json({ error: "Task not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

requestTasks.delete("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const deletedRequestTask = await deleteRequestTask(id);
    if (deletedRequestTask) {
      res.status(200).json(deletedRequestTask);
    } else {
      res.status(404).json({ error: "Task not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = requestTasks;
