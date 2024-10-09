const admin = require("../firebase-admin");

async function verifyAdmin(req, res, next) {
  const token = req.headers.authorization?.split("Bearer ")[1];
  if (!token) {
    return res
      .status(401)
      .json({ message: "Unauthorized - No token provided" });
  }
  try {
    const decodedToken = await admin.auth().verifyIdToken(token);

    if (!decodedToken.admin) {
      return res.status(403).json({ message: "Forbidden - Admins only" });
    }

    req.user = decodedToken;
    next();
  } catch (error) {
    return res
      .status(401)
      .json({ message: "Unauthorized - Invalid token", error });
  }
}

module.exports = { verifyAdmin };
