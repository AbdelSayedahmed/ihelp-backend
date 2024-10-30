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
const categoriesController = require("./controllers/categoriesController");
const volunteerWebappController = require("./controllers/volunteerWebappController");

// Configuration
const app = express();

// Middleware
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "DELETE", "PUT", "OPTIONS"],
    allowedHeaders: ["Authorization", "Content-Type"],
  })
);
app.use(express.json());

// Root Route
app.get("/", (req, res) => res.send("Welcome to iHelp"));

// Routes
app.use("/badges", badgesController);
app.use("/organizations", verifyToken, organizationsController);
app.use("/requesters", verifyToken, requestersController);
app.use("/requests", verifyToken, requestsController);
app.use("/tasks", verifyToken, requestTasksController);
app.use("/rewards", verifyToken, rewardsController);
app.use("/statuses", verifyToken, statusesController);
app.use("/volunteers", verifyToken, volunteersController);
app.use("/volunteers-webapp", volunteerWebappController);
app.use("/categories", categoriesController);

// 404 Page
app.get("*", (req, res) => res.status(404).send("Page not found"));

// Export
module.exports = app;
