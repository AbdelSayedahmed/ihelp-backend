const db = require("../db/db-config.js");

const getAllVolunteers = async (uid) => {
	try {
		const organization = await db.oneOrNone(
			"SELECT id FROM organizations WHERE uid = $1",
			[uid]
		);

		if (!organization) {
			throw new Error("Organization not found");
		}

		const allVolunteers = await db.any(
			`
      SELECT 
        volunteers.uid,
        volunteers.id,
        volunteers.organization_id,
        volunteers.name,
        volunteers.email,
        volunteers.age,
        volunteers.points_earned,
        volunteers.created_at,
        volunteers.updated_at,
        volunteers.is_active
      FROM volunteers
      WHERE volunteers.organization_id = $1
      `,
			[organization.id]
		);

		return allVolunteers;
	} catch (error) {
		throw error;
	}
};

const getVolunteerById = async (id) => {
	try {
		const volunteer = await db.one("SELECT * FROM volunteers WHERE id=$1", id);
		return volunteer;
	} catch (error) {
		throw error;
	}
};

const createVolunteer = async (volunteer) => {
	const { organization_id, name, email, age } = volunteer;

	try {
		const newVolunteer = await db.one(
			"INSERT INTO volunteers (organization_id, name, email, age) VALUES($1, $2, $3, $4) RETURNING *",
			[organization_id, name, email, age]
		);
		return newVolunteer;
	} catch (error) {
		throw error;
	}
};

const deleteVolunteer = async (id) => {
	try {
		const deletedVolunteer = await db.one(
			"DELETE FROM volunteers WHERE id = $1 RETURNING *",
			id
		);
		return deletedVolunteer;
	} catch (error) {
		throw error;
	}
};

const updateVolunteer = async (id, volunteer) => {
	const { organization_id, name, email, age } = volunteer;

	try {
		const updatedVolunteer = await db.one(
			"UPDATE volunteers SET organization_id=$1, name=$2, email=$3, age=$4  WHERE id=$5 RETURNING *",
			[organization_id, name, email, age, id]
		);
		return updatedVolunteer;
	} catch (error) {
		throw error;
	}
};
const getVolunteerProfile = async (volunteerId) => {
	return await db.oneOrNone(
		`
        SELECT 
            v.id,
            v.name AS username,
            a.img_url AS avatar_url,
            v.points_earned AS total_points,
            TO_CHAR(v.created_at, 'Mon, YYYY') AS start_date,
            ARRAY_AGG(DISTINCT b.id) AS badges,
            JSON_AGG(DISTINCT JSONB_BUILD_OBJECT(
                'id', r.id,
                'reward_name', r.name,
                'reward_description', r.description
            )) AS rewards
        FROM volunteers v
        LEFT JOIN avatars a ON v.avatar_id = a.id
        LEFT JOIN badges_earned be ON be.volunteer_id = v.id
        LEFT JOIN badges b ON be.badge_id = b.id
        LEFT JOIN rewards_earned re ON re.volunteer_id = v.id
        LEFT JOIN rewards r ON re.reward_id = r.id
        WHERE v.id = $1
        GROUP BY v.id, a.img_url, v.points_earned, v.created_at
		`,
		[volunteerId]
	);
};

module.exports = {
	getAllVolunteers,
	getVolunteerById,
	createVolunteer,
	deleteVolunteer,
	updateVolunteer,
	getVolunteerProfile,
};
