const db = require("../db/db-config.js");

const getAllRequesters = async () => {
  try {
    const allRequesters = await db.any("SELECT * FROM requesters");
    console.log(allRequesters);
    return allRequesters;
  } catch (error) {
    throw error;
  }
};

const getRequesterById = async (id) => {
  try {
    const requester = await db.one("SELECT * FROM requesters WHERE id=$1", id);
    return requester;
  } catch (error) {
    throw error;
  }
};

const createRequester = async (requester) => {
  const { name, phone, org_id } = requester;

  try {
    const newRequester = await db.one(
      "INSERT INTO requesters (name, phone, org_id) VALUES($1, $2, $3) RETURNING *",
      [name, phone, org_id]
    );
    return newRequester;
  } catch (error) {
    throw error;
  }
};

const deleteRequester = async (id) => {
  try {
    const deletedRequester = await db.one(
      "DELETE FROM requesters WHERE id = $1 RETURNING *",
      id
    );
    return deletedRequester;
  } catch (error) {
    throw error;
  }
};

const updateRequester = async (id, requester) => {
  const { name, phone, org_id } = requester;

  try {
    const updatedRequester = await db.one(
      "UPDATE requesters SET name=$1, phone=$2, org_id=$3 WHERE id=$4 RETURNING *",
      [name, phone, org_id, id]
    );
    return updatedRequester;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllRequesters,
  getRequesterById,
  createRequester,
  deleteRequester,
  updateRequester,
};
