const db = require("../db/db-config.js");

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
        return request;
    } catch (error) {
        throw error;
    }
}

const createRequest = async (request) => {
    const {
        id,
        description,
        created_at,
        updated_at,
        volunteer: { id, name, email, age, points_earned },
        requester: { id, name, phone },
        status: { id, name },
        tasks: [
            {
                id,
                description,
                due_date,
                point_earnings,
                assigned_volunteers: [{
                    volunteer_id, name, status, reassigned_at
                }]
            }
        ]
    } = request;
    try {
        const newRequest = await db.one("INSERT INTO requests (id, description, created_at, updated_at, volunteer, requester, status, tasks) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *", [id, description, created_at, updated_at, volunteer, requester, status, tasks]);
        return newRequest;
    } catch (error) {
        throw error;
    }
}