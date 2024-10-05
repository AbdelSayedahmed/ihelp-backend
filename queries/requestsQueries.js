const db = require("../db/db-config.js");

const { getVolunteerById } = require("../queries/volunteersQueries.js");
const { getRequesterById } = require("../queries/requestersQueries.js");
const { getStatusById } = require("../queries/statusesQueries.js");
const { getRequestTaskById } = require("../queries/requestTasksQueries.js");

const getAllRequests = async () => {
	try {
	  const allRequests = await db.any(`
		  SELECT 
			requests.id,
			requests.organization_id,
			requests.volunteer_id,
			volunteers.name AS volunteer_name,
			requests.requester_id,
			requesters.name AS requester_name,
			requests.status_id,
			request_status.name AS status_name,
			requests.description,
			requests.created_at,
			requests.updated_at
		  FROM requests
		  LEFT JOIN volunteers ON requests.volunteer_id = volunteers.id
		  LEFT JOIN requesters ON requests.requester_id = requesters.id
		  LEFT JOIN request_status ON requests.status_id = request_status.id
		`);
	  return allRequests;
	} catch (error) {
	  console.error("Error fetching requests:", error);
	  throw new Error("Unable to retrieve requests");
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

const createRequest = async (request) => {
  const {
    requester_id,
    volunteer_id,
    organization_id,
    status_id,
    description,
  } = request;

  try {
    const newRequest = await db.one(
      "INSERT INTO requests (requester_id, volunteer_id, organization_id, status_id, description) VALUES($1, $2, $3, $4, $5) RETURNING *",
      [requester_id, volunteer_id, organization_id, status_id, description]
    );
    return newRequest;
  } catch (error) {
    throw error;
  }
};

const updateRequest = async (id, request) => {
  const {
    requester_id,
    volunteer_id,
    organization_id,
    status_id,
    description,
    created_at,
    updated_at,
  } = request;

  try {
    const updatedRequest = await db.one(
      "UPDATE requests SET requester_id=$1, volunteer_id=$2, organization_id=$3, status_id=$4, description=$5, created_at=$6, updated_at=$7 WHERE id=$8 RETURNING *",
      [
        requester_id,
        volunteer_id,
        organization_id,
        status_id,
        description,
        created_at,
        updated_at,
        id,
      ]
    );
    return updatedRequest;
  } catch (error) {
    throw error;
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
  getRequestById,
  createRequest,
  updateRequest,
  deleteRequest,
};
