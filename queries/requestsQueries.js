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
			requests.requester_id,
			categories.id AS category_id,
			categories.name AS category_name,
			requesters.first_name AS requester_first_name,
			requesters.last_name AS requester_last_name,
			requests.status_id,
			request_status.name AS status_name,
			requests.description,
			COUNT(DISTINCT request_task.id) AS total_tasks,        
			COUNT(DISTINCT assigned_tasks.id) AS assigned_tasks,
			requests.created_at,
			requests.updated_at
	FROM requests
	LEFT JOIN categories ON requests.category_id = categories.id
	LEFT JOIN requesters ON requests.requester_id = requesters.id
	LEFT JOIN request_status ON requests.status_id = request_status.id
	LEFT JOIN request_task ON requests.id = request_task.request_id     
	LEFT JOIN assigned_tasks ON request_task.id = assigned_tasks.request_task_id
	WHERE requests.organization_id = $1
	GROUP BY 
			requests.id,
			requests.organization_id,
			requests.requester_id,
			requesters.first_name,
			requesters.last_name,
			requests.status_id,
			request_status.name,
			requests.description,
			categories.id,
			requests.created_at,
			requests.updated_at;
	
      `,
      [organization.id]
    );

    return allRequests;
  } catch (error) {
    throw error;
  }
};

const getRequestById = async (id) => {
  try {
    const requestWithTasks = await db.oneOrNone(
      `
			SELECT 
				requests.id,
				requests.organization_id,
				requests.requester_id,
				requests.hours_needed,
				categories.id AS category_id,
				categories.name AS category_name,
				requesters.first_name AS requester_first_name,
				requesters.last_name AS requester_last_name,
				requesters.phone AS requester_phone,
				requests.status_id,
				request_status.name AS status_name,
				requests.description,
				COUNT(DISTINCT request_task.id) AS total_tasks,
				COUNT(DISTINCT assigned_tasks.id) AS assigned_tasks,
				requests.created_at,
				requests.updated_at,
				json_agg(
					json_build_object(
						'id', request_task.id,
						'description', request_task.task,
						'due_date', request_task.due_date,
						'points_earned', request_task.point_earnings,
						'volunteer_id', volunteers.id,
						'volunteer_name', volunteers.name,
						'volunteer_email', volunteers.email,
						'task_progress', task_progress.name
					)
				) AS tasks
			FROM requests
			LEFT JOIN categories ON requests.category_id = categories.id
			LEFT JOIN requesters ON requests.requester_id = requesters.id
			LEFT JOIN request_status ON requests.status_id = request_status.id
			LEFT JOIN request_task ON requests.id = request_task.request_id     
			LEFT JOIN assigned_tasks ON request_task.id = assigned_tasks.request_task_id
			LEFT JOIN volunteers ON assigned_tasks.volunteer_id = volunteers.id
			LEFT JOIN task_progress ON assigned_tasks.task_progress_id = task_progress.id
			WHERE requests.id = $1
			GROUP BY 
				requests.id,
				requests.organization_id,
				requests.requester_id,
				requests.hours_needed,
				requesters.first_name,
				requesters.last_name,
				requesters.phone,
				requests.status_id,
				request_status.name,
				requests.description,
				categories.id,
				requests.created_at,
				requests.updated_at
			`,
      [id]
    );

    if (!requestWithTasks) {
      throw new Error("Request not found");
    }

    return requestWithTasks;
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

  const { category, due_date, description, hours_needed, requester, tasks } =
    requestData;

  try {
    const { id: request_id } = await db.one(
      `INSERT INTO requests 
			(organization_id, requester_id, status_id, description, hours_needed, category_id, due_date, created_at, updated_at) 
			VALUES 
			($1, $2, $3, $4, $5, $6, $7, NOW(), NOW()) 
			RETURNING id`,
      [
        organization_id,
        requester,
        1,
        description,
        hours_needed,
        category,
        due_date,
      ]
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
    due_date,
    hours_needed,
    tasks,
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

    if (requester_id)
      fields.push(`requester_id = $${index++}`) && values.push(requester_id);
    if (volunteer_id)
      fields.push(`volunteer_id = $${index++}`) && values.push(volunteer_id);
    if (organization_id)
      fields.push(`organization_id = $${index++}`) &&
        values.push(organization_id);
    if (status_id)
      fields.push(`status_id = $${index++}`) && values.push(status_id);
    if (description)
      fields.push(`description = $${index++}`) && values.push(description);
    if (due_date)
      fields.push(`due_date = $${index++}`) && values.push(due_date);
    if (hours_needed)
      fields.push(`hours_needed = $${index++}`) && values.push(hours_needed);
    fields.push(`updated_at = NOW()`);

    const query = `UPDATE requests SET ${fields.join(
      ", "
    )} WHERE id = $${index} RETURNING *`;
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
  getRequestById,
  createRequest,
  updateRequest,
  deleteRequest,
};
