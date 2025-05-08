const admin = require("firebase-admin");
const serviceAccount = require("./firebase-credentials.json");

admin.initializeApp({
	credential: admin.credential.cert(
		serviceAccount || process.env.FIREBASE_CREDENTIALS
	),
});

module.exports = admin;
