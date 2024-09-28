// Dependencies
const cors = require("cors");
const express = require("express");

// Route Imports
const requestersController = require("./controllers/requestersController");
const volunteersController = require("./controllers/volunteersController");

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

// 404 Page
app.get("*", (req, res) => res.status(404).send("Page not found"));

// Export
module.exports = app;
