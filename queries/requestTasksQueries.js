const db = require("../db/db-config.js");

const getAllRequestTasks = async () => {
    try {
        const allRequestTasks = await db.any("SELECT * FROM request_task");
        console.log(allRequestTasks);
        return allRequestTasks;
    } catch (error) {
        throw error;
    }
};

const getRequestTaskById = async (id) => {
    try {
        const requestTask = await db.one("SELECT * FROM request_task WHERE id=$1", id);
        return requestTask;
    } catch (error) {
        throw error;
    }
};

module.exports = {
    getAllRequestTasks,
    getRequestTaskById,
    // createRequestTask,
    // updateRequestTask,
    // deleteRequestTask
}