const db = require("../db/db-config");
const requestersQueries = require("../queries/requestersQueries");

// Get all requesters
const getAllRequesters = async (req, res) => {
  try {
    const requesters = await db.any(requestersQueries.getAllRequesters);
    res.json(requesters);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Get requester by id
const getRequesterById = async (req, res) => {
  const { id } = req.params;
  try {
    const requester = await db.oneOrNone(requestersQueries.getRequesterById, [
      id,
    ]);
    if (!requester) {
      return res.status(404).json({ error: "Requester not found" });
    }
    res.json(requester);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Create a new requester
const createRequester = async (req, res) => {
  const { name, email, phone, organization, address } = req.body;
  try {
    const newRequester = await db.one(requestersQueries.createRequester, [
      name,
      email,
      phone,
      organization,
      address,
    ]);
    res.status(201).json(newRequester);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Update requester
const updateRequester = async (req, res) => {
  const { id } = req.params;
  const { name, email, phone, organization, address } = req.body;
  try {
    const updatedRequester = await db.one(requestersQueries.updateRequester, [
      name,
      email,
      phone,
      organization,
      address,
      id,
    ]);
    res.json(updatedRequester);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Delete requester
const deleteRequester = async (req, res) => {
  const { id } = req.params;
  try {
    await db.none(requestersQueries.deleteRequester, [id]);
    res.status(204).send();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = {
  getAllRequesters,
  getRequesterById,
  createRequester,
  updateRequester,
  deleteRequester,
};
