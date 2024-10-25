const db = require("../db/db-config.js");
const { getVolunteerById } = require("../queries/volunteersQueries.js");
const { getRequesterById } = require("../queries/requestersQueries.js");
const { getStatusById } = require("../queries/statusesQueries.js");
const { getRequestTaskById } = require("../queries/requestTasksQueries.js");

const getAllRequests = async (uid) => {
	try {
		const organization = await db.oneOrNone(
			"SELECT id FROM organizations WHERE uid = $1",
			[uid]
		);

		if (!organization) {
			throw new Error("Organization not found");
		}

		const allRequests = await db.any(
			`
      SELECT 
        requests.id,
        requests.organization_id,
        requests.volunteer_id,
        volunteers.name AS volunteer_name,
        requests.requester_id,
        requesters.first_name AS requester_first_name,
        requesters.last_name AS requester_last_name,
        requests.status_id,
        request_status.name AS status_name,
        requests.description,
        requests.created_at,
        requests.updated_at
      FROM requests
      LEFT JOIN volunteers ON requests.volunteer_id = volunteers.id
      LEFT JOIN requesters ON requests.requester_id = requesters.id
      LEFT JOIN request_status ON requests.status_id = request_status.id
      WHERE requests.organization_id = $1
      `,
			[organization.id]
		);

		return allRequests;
	} catch (error) {
		console.error("Error fetching requests:", error);
		throw new Error("Server error");
	}
};

const getRequestById = async (id) => {
	try {
		const request = await db.one("SELECT * FROM requests WHERE id=$1", id);
		const request_task = await db.one(
			"SELECT * FROM request_task WHERE id=$1",
			id
		);

		const volunteer = await getVolunteerById(request.volunteer_id);
		const requester = await getRequesterById(request.requester_id);
		const status = await getStatusById(request.status_id);
		const requestTask = await getRequestTaskById(request_task.request_id);

		const results = {
			id: request.id,
			description: request.description,
			created_at: request.created_at,
			updated_at: request.updated_at,
			volunteer: {
				id: volunteer.id,
				name: volunteer.name,
				email: volunteer.email,
				age: volunteer.age,
				points_earned: volunteer.points_earned,
			},
			requester: {
				id: requester.id,
				name: requester.name,
				phone: requester.phone,
			},
			status: {
				id: status.id,
				name: status.name,
			},
			task: [
				{
					id: requestTask.id,
					description: requestTask.description,
					due_date: requestTask.due_date,
					points_earned: requestTask.points_earned,
					assigned_volunteers: [
						{
							id: volunteer.id,
							name: volunteer.name,
							email: volunteer.email,
						},
					],
					task_progress: [{}],
				},
			],
		};
		return results;
	} catch (error) {
		throw error;
	}
};

const createRequest = async (uid, requestData) => {
	const organization = await db.oneOrNone(
		"SELECT id FROM organizations WHERE uid = $1",
		[uid]
	);

	if (!organization) {
		throw new Error("Organization not found");
	}

	const organization_id = organization.id;

	const { category, due_date, description, requester, volunteer, tasks } =
		requestData;

	try {
		const { id: request_id } = await db.one(
			`INSERT INTO requests 
        (organization_id, requester_id, volunteer_id, status_id, description, category, created_at, updated_at) 
      VALUES 
        ($1, $2, $3, $4, $5, $6, NOW(), NOW()) 
      RETURNING id`,
			[organization_id, requester, volunteer || null, 1, description, category]
		);

		const taskPromises = tasks.map((task) =>
			db.one(
				`INSERT INTO request_task 
          (requester_id, organization_id, request_id, point_earnings, task, due_date, created_at, updated_at) 
        VALUES 
          ($1, $2, $3, $4, $5, $6, NOW(), NOW()) 
        RETURNING id`,
				[
					requester,
					organization_id,
					request_id,
					parseInt(task.points, 10),
					task.task,
					due_date,
				]
			)
		);

		const insertedTasks = await Promise.all(taskPromises);

		return { request_id, tasks: insertedTasks };
	} catch (error) {
		throw new Error(`Failed to create request: ${error.message}`);
	}
};

const updateRequest = async (id, updates) => {
	const {
		requester_id,
		volunteer_id,
		organization_id,
		status_id,
		description,
		created_at,
	} = updates;

	try {
		const existingRequest = await db.oneOrNone(
			"SELECT id FROM requests WHERE id = $1",
			[id]
		);

		if (!existingRequest) {
			throw new Error(`Request with id ${id} not found`);
		}

		const fields = [];
		const values = [];
		let index = 1;

		if (requester_id) {
			fields.push(`requester_id = $${index++}`);
			values.push(requester_id);
		}
		if (volunteer_id) {
			fields.push(`volunteer_id = $${index++}`);
			values.push(volunteer_id);
		}
		if (organization_id) {
			fields.push(`organization_id = $${index++}`);
			values.push(organization_id);
		}
		if (status_id) {
			fields.push(`status_id = $${index++}`);
			values.push(status_id);
		}
		if (description) {
			fields.push(`description = $${index++}`);
			values.push(description);
		}
		if (created_at) {
			fields.push(`created_at = $${index++}`);
			values.push(created_at);
		}

		fields.push(`updated_at = NOW()`);

		const query = `
      UPDATE requests 
      SET ${fields.join(", ")} 
      WHERE id = $${index} 
      RETURNING *`;

		values.push(id);

		const updatedRequest = await db.one(query, values);
		return updatedRequest;
	} catch (error) {
		throw new Error(`Failed to update request: ${error.message}`);
	}
};

const deleteRequest = async (id) => {
	try {
		const deletedRequest = await db.one(
			"DELETE FROM requests WHERE id=$1 RETURNING *",
			id
		);
		return deletedRequest;
	} catch (error) {
		throw error;
	}
};

module.exports = {
	getAllRequests,
	getOpenRequests,
	getRequestById,
	createRequest,
	updateRequest,
	deleteRequest,
};
