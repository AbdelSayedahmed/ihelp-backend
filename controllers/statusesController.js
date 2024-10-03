const express = require("express");
const status = express.Router();
const {
  getAllStatuses,
  getStatusById,
  createStatus,
  updateStatus,
  deleteStatus,
 } = require("../queries/statusesQueries");    
 
 status.get("/", async (req, res) => {
   try {
     const allStatuses = await getAllStatuses();
     res.status(200).json(allStatuses);
   } catch (error) {
     res.status(500).json({ error: "Server error" });
   }
 });

 status.get("/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const status = await getStatusById(id);
      if (status) {
        res.json(status);
      } else {
        res.status(404).json({ error: "Status not found" });
      }
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });

  status.post("/", async (req, res) => {
    try {
      const newStatus = await createStatus(req.body);
      res.status(201).json(newStatus);
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });

  status.put("/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const updatedStatus = await updateStatus(id, req.body);

      res.status(200).json(updatedStatus);
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });

  status.delete("/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const deletedStatus = await deleteStatus(id);
      if (deletedStatus) {
        res.status(200).json(deletedStatus);
      } else {
        res.status(404).json({ error: "Status not found" });
      }
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });

  module.exports = status;
