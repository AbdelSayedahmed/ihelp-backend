// DEPENDENCIES
const app = require("./app.js");

// CONFIGURATION
require("dotenv").config();
const PORT = process.env.PORT;

// LISTEN
app.listen(PORT, "0.0.0.0", () =>
	console.log(`Listening on port http://0.0.0.0:${PORT}`)
);
