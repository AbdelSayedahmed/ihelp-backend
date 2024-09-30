const db = require("../db/db-config.js");

const { getVolunteerById } = require("../queries/volunteersQueries.js");
const {getRequesterById } = require("../queries/requestersQueries.js");

const getAllRequests = async () => {
    try {
        const allRequests = await db.any("SELECT * FROM requests");
        console.log(allRequests);
        return allRequests;
    } catch (error) {
        throw error;
    }
};

const getRequestById = async (id) => {
    try {
        const request = await db.one("SELECT * FROM requests WHERE id=$1", id);
        const volunteer = await getVolunteerById(request.volunteer_id);
        console.log(volunteer);
        const requester = await getRequesterById(request.requester_id);

        const results = { id: request.id, description: request.description, created_at: request.created_at, updated_at: request.updated_at, volunteer: {id: volunteer.id, name: volunteer.name, email: volunteer.email, age: volunteer.age, points_earned: volunteer.points_earned}, requester: {id: requester.id, name: requester.name, phone: requester.phone}}
        return results;
    } catch (error) {
        throw error;
    }
}

const createRequest = async (request) => {
    const { requester_id, volunteer_id, org_id, status_id, description } = request;

    try {
        const newRequest = await db.one(
            "INSERT INTO requests (org_id, requester_id, volunteer_id, description, status_id) VALUES($1, $2, $3, $4, $5) RETURNING *",
            [requester_id, volunteer_id, org_id, status_id, description]
        );
        return newRequest;
    } catch (error) {
        throw error;
    }
};

const updateRequest = async (id, request) => {
    const { requester_id, volunteer_id, org_id, status_id, description } = request;

    try {
        const updatedRequest = await db.one("UPDATE requests SET requester_id=$1, volunteer_id=$2, org_id=$4, status_id=$5, description=$6 WHERE id=$7 RETURNING *"
            [requester_id, volunteer_id, org_id, status_id, description, id]
        );
        return updatedRequest;
    } catch (error) {
        throw error;
    }
};

const deleteRequest = async (id) => {
    try {
        const deletedRequest = await db.one(
            "DELETE FROM requests WHERE id=$1 RETURNING *", id
        );
        return deletedRequest;
    } catch (error) {
        throw error;
    }
};

module.exports = {
    getAllRequests,
    getRequestById,
    createRequest,
    updateRequest,
    deleteRequest
};