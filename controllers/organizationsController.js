const express = require("express");
const organizations = express.Router();
const {
  getAllOrganizations,
  getOrganizationById,
  createOrganization,
  updateOrganization,
  deleteOrganization,
} = require("../queries/organizationsQueries");

organizations.get("/", async (req, res) => {
  try {
    const allOrganizations = await getAllOrganizations();
    res.status(200).json(allOrganizations);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

organizations.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const organization = await getOrganizationById(id);
    if (organization) {
      res.status(200).json(organization);
    } else {
      res.status(404).json({ error: "Organization not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

organizations.post("/", async (req, res) => {
  const { name, description } = req.body;

  if (!name || !description)
    return res.status(400).json({ error: "Missing required fields" });

  try {
    const newOrganization = await createOrganization(req.body);
    res.status(201).json(newOrganization);
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

organizations.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { name, description } = req.body;

  if (!name || !description)
    return res.status(400).json({ error: "Missing required fields" });

  try {
    const updatedOrganization = await updateOrganization(id, req.body);
    if (updatedOrganization) {
      res.status(200).json(updatedOrganization);
    } else {
      res.status(404).json({ error: "Organization not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

organizations.delete("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const deletedOrganization = await deleteOrganization(id);
    if (deletedOrganization) {
      res.status(200).json(deletedOrganization);
    } else {
      res.status(404).json({ error: "Organization not found" });
    }
  } catch (error) {
    res.status(500).json({ error: "Server error" });
  }
});

module.exports = organizations;
