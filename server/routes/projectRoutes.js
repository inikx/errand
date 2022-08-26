const express = require("express");
const router = express.Router();
const projectController = require("../controllers/projectController");
const auth = require("../middleware/jvt");

router.get("", auth, projectController.getProjects);
router.post("/create", auth, projectController.createProject);
router.put("/update", auth, projectController.updateProject);
router.get("/users/:id", auth, projectController.getAllProjectUsers);
router.get("/invites/all", auth, projectController.getInvitedProjects);
router.post("/add/user", auth, projectController.addUserToProject);
router.post("/update/invite", auth, projectController.updateProjectInvite);
router.delete("/remove", auth, projectController.removeProject);

module.exports = router;
