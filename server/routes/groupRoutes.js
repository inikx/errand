const express = require("express");
const router = express.Router();
const groupController = require("../controllers/groupController");
const auth = require("../middleware/jvt");

router.get("", auth, groupController.getGroups);
router.post("/create", auth, groupController.createGroup);
router.put("/update", auth, groupController.updateGroup);
router.post("/add/user", auth, groupController.addUserToGroup);
router.delete("/remove", auth, groupController.removeGroup);

module.exports = router;
