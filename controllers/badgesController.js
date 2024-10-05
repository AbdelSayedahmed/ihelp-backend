const express = require("express");
const badges = express.Router();
const {
  getAllBadges,
  getBadgeById,
  createBadge,
  updateBadge,
  deleteBadge,
} = require("../queries/badgesQueries");

badges.get("/", async (req, res) => {
  try {
    const allBadges = await getAllBadges();
    res.status(200).json(allBadges);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

badges.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const badge = await getBadgeById(id);
    if (badge) {
      res.status(200).json(badge);
    } else {
      res.status(404).json({ error: "Badge not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

badges.post("/", async (req, res) => {
  const { name, description } = req.body;

  if (!name || !description) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  try {
    const newBadge = await createBadge(req.body);
    res.status(201).json(newBadge);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

badges.put("/:id", async (req, res) => {
  const { id } = req.params;

  if (!req.body.name || !req.body.description) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  try {
    const updatedBadge = await updateBadge(id, req.body);
    if (updatedBadge) {
      res.status(200).json(updatedBadge);
    } else {
      res.status(404).json({ error: "Badge not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

badges.delete("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const deletedBadge = await deleteBadge(id);
    if (deletedBadge) {
      res.status(200).json(deletedBadge);
    } else {
      res.status(404).json({ error: "Badge not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = badges;
