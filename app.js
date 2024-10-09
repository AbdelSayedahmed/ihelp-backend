// Dependencies
const cors = require("cors");
const express = require("express");
const { verifyToken } = require("./middleware/auth.middleware.js");

// Route Imports
const badgesController = require("./controllers/badgesController");
const organizationsController = require("./controllers/organizationsController");
const requestersController = require("./controllers/requestersController");
const requestsController = require("./controllers/requestsController");
const requestTasksController = require("./controllers/requestTasksController");
const rewardsController = require("./controllers/rewardsController");
const statusesController = require("./controllers/statusesController");
const volunteersController = require("./controllers/volunteersController");

// Configuration
const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Root Route
app.get("/", (req, res) => res.send("Welcome to iHelp"));

// Routes
app.use("/badges", badgesController);
app.use("/organizations", organizationsController);
app.use("/requesters", requestersController);
app.use("/requests", verifyToken, requestsController);
app.use("/tasks", verifyToken, requestTasksController);
app.use("/rewards", rewardsController);
app.use("/statuses", statusesController);
app.use("/volunteers", verifyToken, volunteersController);

// 404 Page
app.get("*", (req, res) => res.status(404).send("Page not found"));

// Export
module.exports = app;
