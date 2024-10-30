const express = require("express");
const volunteerWebpp = express.Router();

volunteerWebpp.get("/", (req, res) => {
  res.send("Hello volunteerWebpp");
});

module.exports = volunteerWebpp;
