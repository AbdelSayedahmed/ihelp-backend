const db = require("../db/db-config.js");

const getAllRewards = async () => {
  try {
    const allRewards = await db.any("SELECT * FROM rewards");
    return allRewards;
  } catch (error) {
    return error;
  }
};

const getRewardById = async (id) => {
  try {
    const reward = await db.one("SELECT * FROM rewards WHERE id=$1", id);
    return reward;
  } catch (error) {
    return error;
  }
};


const createReward = async (reward) => {
  try {
    const newReward = await db.one(
      "INSERT INTO rewards (name, description, points_required) VALUES ($1, $2, $3) RETURNING *",
      [reward.name, reward.description, reward.points_required]
    );
    return newReward;
  } catch (error) {
    return error;
  }
};


const updateReward = async (id, reward) => {
  try {
    const updatedReward = await db.one(
      "UPDATE rewards SET name=$1, description=$2, points_required=$3 WHERE id=$4 RETURNING *",
      [reward.name, reward.description, reward.points_required, id]
    );
    return updatedReward;
  } catch (error) {
    return error;
  }
};


const deleteReward = async (id) => {
  try {
    const deletedReward = await db.one(
      "DELETE FROM rewards WHERE id=$1 RETURNING *",
      id
    );
    return deletedReward;
  } catch (error) {
    return error;
  }
};


module.exports = {
  getAllRewards,
  getRewardById,
  createReward,
  updateReward,
  deleteReward,
};