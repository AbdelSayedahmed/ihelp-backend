const express = require("express");
const categories = express.Router();

const { getAllCategories } = require("../queries/categoriesQueries.js");

categories.get("/", async (req, res) => {
  try {
    const categories = await getAllCategories();
    res.status(200).json(categories);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = categories;
