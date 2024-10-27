const admin = require("firebase-admin");
const serviceAccount = require("./firebase-credential.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = admin;
