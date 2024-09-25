const express = require("express");
const requestersController = require("../controllers/requestersController");
const router = express.Router();

router.get("/", requestersController.getAllRequesters);
router.get("/:id", requestersController.getRequesterById);
router.post("/", requestersController.createRequester);
router.put("/:id", requestersController.updateRequester);
router.delete("/:id", requestersController.deleteRequester);

module.exports = router;
