const db = require("../db/db-config.js");

// Add this helper function
function getVolunteerIdByUid(uid) {
	return db.oneOrNone(
		`
    SELECT id 
    FROM volunteers 
    WHERE uid = $1
  `,
		[uid]
	);
}

function getOpenRequests() {
	return db.any(
		`
    SELECT 
    r.id,
    r.due_date as date,
    r.event_time,
    r.status_id,
    rs.name as status_name,
    c.name as category,
    r.hours_needed as hours,
    c.id as category_id,
    COUNT(rt.id) as tasks_total,
    COALESCE(
      json_agg(
        json_build_object(
          'volunteer_id', v.id,
          'avatar_url', av.img_url
        )
      ) FILTER (WHERE v.id IS NOT NULL),
      '[]'
    ) as assigned_volunteers
  FROM requests r 
  LEFT JOIN categories c ON r.category_id = c.id
  LEFT JOIN request_task rt ON r.id = rt.request_id
  LEFT JOIN assigned_tasks at ON rt.id = at.request_task_id
  LEFT JOIN volunteers v ON at.volunteer_id = v.id
  LEFT JOIN avatars av ON v.avatar_id = av.id
  LEFT JOIN request_status rs ON r.status_id = rs.id
  WHERE r.status_id = 1
  GROUP BY r.id, r.due_date, c.name, r.hours_needed, c.id, rs.name
  ORDER BY r.due_date;
    `
	);
}
async function getRequestDetails(requestId) {
	return db.oneOrNone(
		`
    SELECT 
      r.id,
      c.name as category,
      c.id as category_id,
      r.due_date as date,
      r.hours_needed as hours,
      r.event_time,
      r.description,
      (
        SELECT SUM(rt.point_earnings) 
        FROM request_task rt 
        WHERE rt.request_id = r.id
      ) as points,
      json_build_object(
        'street', a.street,
        'city', a.city,
        'state', a.state,
        'zip_code', a.zip_code
      ) as address,
      COALESCE(
        json_agg(
          json_build_object(
            'id', rt.id,
            'description', rt.task,
            'points', rt.point_earnings,
            'status', ts.name,
            'status_id', COALESCE(at.task_progress_id, 1),
            'volunteer_id', v.id,
            'volunteer_username', v.name,
            'volunteer_avatar_url', av.img_url
          ) ORDER BY rt.id
        ) FILTER (WHERE rt.id IS NOT NULL),
        '[]'
      ) as tasks
    FROM requests r
    JOIN categories c ON r.category_id = c.id
    JOIN organizations o ON r.organization_id = o.id
    JOIN addresses a ON o.address_id = a.id
    LEFT JOIN request_task rt ON r.id = rt.request_id
    LEFT JOIN assigned_tasks at ON rt.id = at.request_task_id
    LEFT JOIN task_progress ts ON at.task_progress_id = ts.id
    LEFT JOIN volunteers v ON at.volunteer_id = v.id
    LEFT JOIN avatars av ON v.avatar_id = av.id
    WHERE r.id = $1 
    GROUP BY r.id, c.name, c.id, r.due_date, r.hours_needed, r.description, a.street, a.city, a.state, a.zip_code
  `,
		requestId
	);
}

function getVolunteerProfile(volunteerId) {
	return db.oneOrNone(
		`
    SELECT 
      v.id,
      v.name as username,
      av.img_url as avatar_url,
      v.points_earned as total_points,
      v.created_at as start_date,
      COALESCE(
        (
          SELECT array_agg(be.badge_id)
          FROM badges_earned be
          WHERE be.volunteer_id = v.id
        ),
        '{}'
      ) as badges,
      COALESCE(
        json_agg(
          json_build_object(
            'id', r.id,
            'reward_name', r.name,
            'reward_description', r.description,
            'reward_icon_url', r.img_url
          )
        ) FILTER (WHERE r.id IS NOT NULL),
        '[]'
      ) as rewards
    FROM volunteers v
    LEFT JOIN avatars av ON v.avatar_id = av.id
    LEFT JOIN rewards_earned re ON v.id = re.volunteer_id
    LEFT JOIN rewards r ON re.reward_id = r.id
    WHERE v.id = $1 
    GROUP BY v.id, v.name, av.img_url, v.points_earned, v.created_at
  `,
		volunteerId
	);
}
function getLeaderboardVolunteers() {
	return db.any(
		`
    SELECT
      v.id,
      v.name as username,
      v.points_earned AS total_points,
      v.hours_earned AS total_hours,
      av.img_url as avatar_url
    FROM volunteers v
    LEFT JOIN avatars av ON v.avatar_id = av.id
    ORDER BY v.points_earned DESC
    LIMIT 10
  `
	);
}
function getTasksByVolunteerId(volunteerId) {
	return db.any(
		`
    SELECT
    at.id,
    at.request_task_id as task_id,
    r.category_id,
    r.hours_needed,
    r.category,
    r.due_date,
    r.organization_id,

		FROM assigned_tasks AS  at
    LEFT JOIN requests r ON rt.request_id = r.id
    LEFT JOIN request_task rt ON at.request_task_id = rt.id,
    LEFT JOIN volunteers v ON at.volunteer_id = v.id,
    LEFT JOIN task_status ts ON at.task_status_id = ts.id
  `
	);
}
async function commitToTask(volunteerId, taskId) {
	return db.tx(async (t) => {
		try {
			// Insert into assigned_tasks
			const committed = await t.one(
				`
              INSERT INTO assigned_tasks (volunteer_id, request_task_id, task_progress_id)
              VALUES ($1, $2, 1)
              RETURNING *
              `,
				[volunteerId, taskId]
			);

			// Update task status to ASSIGNED
			const updatedTaskStatus = await t.one(
				`
              UPDATE request_task
              SET task_status_id = 2
              WHERE id = $1
              RETURNING *
              `,
				[taskId]
			);

			// Check if all tasks in the same request have status "ASSIGNED"
			const requestId = updatedTaskStatus.request_id;

			const allTasksAssigned = await t.one(
				`
              SELECT COUNT(*) = COUNT(CASE WHEN task_status_id = 2 THEN 1 END) AS all_assigned
              FROM request_task
              WHERE request_id = $1
              `,
				[requestId]
			);

			// Update the request status if all tasks are assigned
			if (allTasksAssigned.all_assigned) {
				const updateRequestStatus = await t.one(
					`
                  UPDATE requests
                  SET status_id = 2
                  WHERE id = $1
                  RETURNING *
                  `,
					[requestId]
				);
				return { committed, updatedTaskStatus, updateRequestStatus };
			}

			// If not all tasks are assigned, only return committed and updated task status
			return { committed, updatedTaskStatus };
		} catch (error) {
			console.error("Error committing to task:", error);
			throw error;
		}
	});
}

async function unCommitToTask(volunteerId, taskId) {
	return db.tx(async (t) => {
		try {
			// Remove from assigned_tasks
			const uncommitted = await t.one(
				`
              DELETE FROM assigned_tasks 
              WHERE volunteer_id = $1 AND request_task_id = $2 
              RETURNING *
              `,
				[volunteerId, taskId]
			);

			// Update task status to OPEN
			const updatedTaskStatus = await t.one(
				`
              UPDATE request_task
              SET task_status_id = 1
              WHERE id = $1
              RETURNING request_id
              `,
				[taskId]
			);

			const requestId = updatedTaskStatus.request_id;

			// Update the request status to OPEN
			const updatedRequestStatus = await t.one(
				`
              UPDATE requests 
              SET status_id = 1 
              WHERE id = $1 
              RETURNING *
              `,
				[requestId]
			);

			return { uncommitted, updatedTaskStatus, updatedRequestStatus };
		} catch (error) {
			console.error("Error uncommitting from task:", error);
			throw error;
		}
	});
}

module.exports = {
  getVolunteerIdByUid,
	getOpenRequests,
	getRequestDetails,
	getVolunteerProfile,
	getLeaderboardVolunteers,
	getTasksByVolunteerId,
	commitToTask,
	unCommitToTask,
};
