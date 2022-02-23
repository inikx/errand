const express = require("express");
const router = express.Router();
const taskController = require("../controllers/taskController");
const auth = require("../middleware/jvt");

router.post("", auth, taskController.getTask);
router.get("/all", auth, taskController.getAllTasks);
router.post("/create", auth, taskController.createTask);
router.put("/update", auth, taskController.updateTask);
router.delete("/remove", auth, taskController.removeTask);

module.exports = router;
