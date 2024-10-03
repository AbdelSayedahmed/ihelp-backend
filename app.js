// Dependencies
const cors = require("cors");
const express = require("express");

// Route Imports
const requestersController = require("./controllers/requestersController");
const volunteersController = require("./controllers/volunteersController");
const organizationsController = require("./controllers/organizationsController");
const requestsController = require("./controllers/requestsController");
const rewardsController = require("./controllers/rewardsController");

// Configuration
const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Root Route
app.get("/", (req, res) => res.send("Welcome to iHelp"));

// Routes
app.use("/requesters", requestersController);
app.use("/volunteers", volunteersController);
app.use("/organizations", organizationsController);
app.use("/requests", requestsController);
app.use("/rewards", rewardsController);

// 404 Page
app.get("*", (req, res) => res.status(404).send("Page not found"));

// Export
module.exports = app;
