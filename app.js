// DEPENDENCIES
const cors = require("cors");
const express = require("express");

// ROUTE IMPORTS
const requestersRoutes = require("./routes/requestersRoutes");

// CONFIGURATION
const app = express();

// MIDDLEWARE
app.use(cors());
app.use(express.json());

// ROOT ROUTE
app.get("/", (req, res) => res.send("Welcome to iHelp"));

// ROUTES
app.use("/requesters", requestersRoutes);

// 404 PAGE
app.get("*", (req, res) => res.status(404).send("Page not found"));

// EXPORT
module.exports = app;
