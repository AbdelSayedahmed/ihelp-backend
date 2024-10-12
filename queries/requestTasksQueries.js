const db = require("../db/db-config.js");

const getAllRequestTasks = async () => {
  try {
    const allRequestTasks = await db.any("SELECT * FROM request_task");
    return allRequestTasks;
  } catch (error) {
    throw error;
  }
};

const getRequestTaskById = async (id) => {
  try {
    const requestTask = await db.one(
      "SELECT * FROM request_task WHERE id=$1",
      id
    );
    return requestTask;
  } catch (error) {
    throw error;
  }
};

const createRequestTask = async (requestTask) => {
  const {
    requester_id,
    organization_id,
    request_id,
    point_earnings,
    due_date,
  } = requestTask;

  try {
    const newRequestTask = await db.one(
      "INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, due_date) VALUES($1, $2, $3, $4, $5) RETURNING *",
      [requester_id, organization_id, request_id, point_earnings, due_date]
    );
    return newRequestTask;
  } catch (error) {
    throw error;
  }
};

const updateRequestTask = async (id, requestTask) => {
  const {
    requester_id,
    organization_id,
    request_id,
    point_earnings,
    due_date,
  } = requestTask;

  try {
    const updatedRequestTask = await db.one(
      "UPDATE request_task SET requester_id=$1, organization_id=$2, request_id=$3, point_earnings=$4, due_date=$5 WHERE id=$6 RETURNING *",
      [requester_id, organization_id, request_id, point_earnings, due_date, id]
    );
    return updatedRequestTask;
  } catch (error) {
    throw error;
  }
};

const deleteRequestTask = async (id) => {
  try {
    const deletedRequestTask = await db.one(
      "DELETE FROM request_task WHERE id=$1 RETURNING *",
      id
    );
    return deletedRequestTask;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllRequestTasks,
  getRequestTaskById,
  createRequestTask,
  updateRequestTask,
  deleteRequestTask,
};
