const db = require("../db/db-config.js");

const getAllBadges = async () => {
  try {
    const allBadges = await db.any("SELECT * FROM badges");
    console.log(allBadges);
    return allBadges;
  } catch (error) {
    throw error;
  }
};

const getBadgeById = async (id) => {
  try {
    const badge = await db.one("SELECT * FROM badges WHERE id=$1", id);
    return badge;
  } catch (error) {
    throw error;
  }
};

const createBadge = async (badge) => {
  const { name, description, img_url, requirement } = badge;

  try {
    const newBadge = await db.one(
      "INSERT INTO badges (name, description, img_url, requirement) VALUES($1, $2, $3, $4) RETURNING *",
      [name, description, img_url, requirement]
    );
    return newBadge;
  } catch (error) {
    throw error;
  }
};

const deleteBadge = async (id) => {
  try {
    const deletedBadge = await db.one(
      "DELETE FROM badges WHERE id = $1 RETURNING *",
      id
    );
    return deletedBadge;
  } catch (error) {
    throw error;
  }
};

const updateBadge = async (id, badge) => {
  const { name, description, img_url, requirement } = badge;

  try {
    const updatedBadge = await db.one(
      "UPDATE badges SET name=$1, description=$2, img_url=$3, requirement=$4 WHERE id=$5 RETURNING *",
      [name, description, img_url, requirement, id]
    );
    return updatedBadge;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllBadges,
  getBadgeById,
  createBadge,
  deleteBadge,
  updateBadge,
};
