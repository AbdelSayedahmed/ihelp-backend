const db = require("../db/db-config.js");

function getAllCategories() {
  return db.any("SELECT * FROM categories");
}

module.exports = {
  getAllCategories,
};
