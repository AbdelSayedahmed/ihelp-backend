const express = require("express");
const rewards = express.Router();
const {
  getAllRewards,
  getRewardById,
  createReward,
  updateReward,
  deleteReward,
}= require("../queries/rewardsQueries");



  // INDEX
  rewards.get("/", async (req, res) => {
    try {
      const allRewards = await getAllRewards();
      res.status(200).json(
        allRewards
      );
      } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });


  rewards.get("/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const reward = await getRewardById(id);
      if (reward) {
        res.json(reward);
      } else {
        res.status(404).json({ error: "Reward not found" });
      }
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });
  // CREATE
  rewards.post("/", async (req, res) => {
    try {
      const newReward = await createReward(req.body);
      res.status(201).json(newReward);
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });

  /// UPDATE
  rewards.put("/:id", async (req, res) => {
    const { id } = req.params;
    const { body } = req;
    try {
      const updatedReward = await updateReward(id, body);
      if (updatedReward) {
        res.status(200).json(updatedReward);
      } else {
        res.status(404).json({ error: "Reward not found" });
      }
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
  });
  // DELETE
  rewards.delete("/:id", async (req, res) => {
    const { id } = req.params;
    try {
      const deletedReward = await deleteReward(id);
      if (deletedReward) {
        res.status(200).json(deletedReward);
      } else {
        res.status(404).json({ error: "Reward not found" });
        }
    } catch (error) {
      res.status(500).json({ error: "Server error" });
    }
});

    module.exports = rewards;


    module.exports = rewards;

