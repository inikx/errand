const express = require("express");
const router = express.Router();
const projectController = require("../controllers/projectController");
const auth = require("../middleware/jvt");

router.get("", auth, projectController.getProjects);
router.post("/create", auth, projectController.createProject);
router.put("/update", auth, projectController.updateProject);
router.get("/users/:id", auth, projectController.getAllProjectUsers);
router.post("/add/user", auth, projectController.addUserToProject);
router.delete("/remove", auth, projectController.removeProject);

module.exports = router;
