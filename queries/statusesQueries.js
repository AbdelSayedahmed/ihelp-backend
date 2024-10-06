const db = require("../db/db-config.js");

const getAllStatuses = async () => {
  try {
    const allStatuses = await db.any("SELECT * FROM request_status");
    return allStatuses;
  } catch (error) {
    throw error;
  }
};

const getStatusById = async (id) => {
  try {
    const status = await db.one("SELECT * FROM request_status WHERE id=$1", id);
    return status;
  } catch (error) {
    throw error;
  }
};

const createStatus = async (status) => {
  const { name, description } = status;

  try {
    const newStatus = await db.one(
      "INSERT INTO request_status (name) VALUES($1) RETURNING *",
      [name]
    );
    return newStatus;
  } catch (error) {
    throw error;
  }
};

const deleteStatus = async (id) => {
  try {
    const deletedStatus = await db.one(
      "DELETE FROM request_status WHERE id = $1 RETURNING *",
      id
    );
    return deletedStatus;
  } catch (error) {
    throw error;
  }
};

const updateStatus = async (id, status) => {
  const { name } = status;

  try {
    const updatedStatus = await db.one(
      "UPDATE request_status SET name = $1 WHERE id = $2 RETURNING *",
      [name, id]
    );
    return updatedStatus;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllStatuses,
  getStatusById,
  createStatus,
  updateStatus,
  deleteStatus,
};
