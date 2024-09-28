const db = require("../db/db-config.js");

// Get all volunteers
const getAllVolunteers = async () => {
  try {
    const allVolunteers = await db.any("SELECT * FROM volunteers");
    return allVolunteers;
  } catch (error) {
    throw error;
  }
};

// Get a volunteer by ID
const getVolunteerById = async (id) => {
  try {
    const volunteer = await db.one("SELECT * FROM volunteers WHERE id=$1", id);
    return volunteer;
  } catch (error) {
    throw error;
  }
};

// Create a new volunteer
const createVolunteer = async (volunteer) => {
  const { name, email, age, points_earned, organization_id, uid } = volunteer;

  try {
    const newVolunteer = await db.one(
      "INSERT INTO volunteers (name, email, age, points_earned, organization_id, uid) VALUES($1, $2, $3, $4, $5, $6) RETURNING *",
      [name, email, age, points_earned, organization_id, uid]
    );
    return newVolunteer;
  } catch (error) {
    throw error;
  }
};

// Update an existing volunteer
const updateVolunteer = async (id, volunteer) => {
  const { name, email, age, points_earned, organization_id, uid } = volunteer;

  try {
    const updatedVolunteer = await db.one(
      "UPDATE volunteers SET name=$1, email=$2, age=$3, points_earned=$4, organization_id=$5, uid=$6 WHERE id=$7 RETURNING *",
      [name, email, age, points_earned, organization_id, uid, id]
    );
    return updatedVolunteer;
  } catch (error) {
    throw error;
  }
};

// Delete a volunteer
const deleteVolunteer = async (id) => {
  try {
    const deletedVolunteer = await db.one(
      "DELETE FROM volunteers WHERE id=$1 RETURNING *",
      id
    );
    return deletedVolunteer;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllVolunteers,
  getVolunteerById,
  createVolunteer,
  updateVolunteer,
  deleteVolunteer,
};
