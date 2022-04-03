const express = require("express");
const router = express.Router();
const taskController = require("../controllers/taskController");
const auth = require("../middleware/jvt");

router.get("/all", auth, taskController.getAllTasks);
router.get("/all/task/:id", auth, taskController.getTaskById);
router.get("/all/project/:id", auth, taskController.getAllTasksByProjectId);
router.post("/create", auth, taskController.createTask);
router.put("/update", auth, taskController.updateTask);
router.delete("/remove", auth, taskController.removeTask);

module.exports = router;
