const express = require("express");
const volunteers = express.Router();
const {
  getAllVolunteers,
  getVolunteerById,
  createVolunteer,
  updateVolunteer,
  deleteVolunteer,
} = require("../queries/volunteersQueries");

volunteers.get("/", async (req, res) => {
  try {
    const uid = req.user.uid;
    const allVolunteers = await getAllVolunteers(uid);
    res.status(200).json(allVolunteers);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

volunteers.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const volunteer = await getVolunteerById(id);
    if (volunteer) {
      res.status(200).json(volunteer);
    } else {
      res.status(404).json({ error: "Volunteer not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

volunteers.post("/", async (req, res) => {
  const { name, email } = req.body;

  if (!name || !email) return res.status(400).json({ error: "Missing required fields: name and email" });

  try {
    const newVolunteer = await createVolunteer(req.body);
    res.status(201).json(newVolunteer);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

volunteers.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { name, email } = req.body;

  if (!name || !email) return res.status(400).json({ error: "Missing required fields: name and email" });

  try {
    const updatedVolunteer = await updateVolunteer(id, req.body);
    if (updatedVolunteer) {
      res.status(200).json(updatedVolunteer);
    } else {
      res.status(404).json({ error: "Volunteer not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

volunteers.delete("/:id", async (req, res) => {
  const { id } = req.params;
  
  try {
    const deletedVolunteer = await deleteVolunteer(id);
    if (deletedVolunteer) {
      res.status(200).json(deletedVolunteer);
    } else {
      res.status(404).json({ error: "Volunteer not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = volunteers;
