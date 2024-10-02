const express = require("express");
const requestTasks = express.Router();
const {
    getAllRequestTasks,
    getRequestTaskById,
    createRequestTask,
    // updateRequestTask,
    // deleteRequestTask
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
            res.json(requestTask);
        } else {
            res.status(404).json({ error: "Tasks not found" });
        }
    } catch (error) {
        res.status(500).json({ error: "Server error" });
    }
});

requestTasks.post("/", async (req, res) => {
    try {
        const newRequestTask = await createRequestTask(req.body);
        res.status(201).json(newRequestTask);
    } catch (error) {
        res.status(500).json({ error: "Server error" });
    }
});

module.exports = requestTasks;