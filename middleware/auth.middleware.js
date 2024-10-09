const admin = require("../firebase-admin.js");

async function verifyToken(req, res, next) {
  const token = req.headers.authorization?.split("Bearer ")[1];
  if (!token) {
    return res
      .status(403)
      .json({ message: "Unauthorized - No token provided" });
  }
  try {
    const decodedToken = await admin.auth().verifyIdToken(token);
    console.log("decodedToken:", decodedToken);
    req.user = decodedToken;
    next();
  } catch (error) {
    return res
      .status(403)
      .json({ message: "Unauthorized - Invalid token", error });
  }
}

module.exports = {
  verifyToken,
};
