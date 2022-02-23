const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const compression = require("compression");
const userRoutes = require("./routes/userRoutes");
const taskRoutes = require("./routes/taskRoutes");
const groupRoutes = require("./routes/groupRoutes");

const app = express();

app.use(express.json());
app.use(morgan("common"));
app.use(compression());
app.use(cors({ credentials: true, origin: true }));

// Routes
app.use("/api", userRoutes);
app.use("/api/task", taskRoutes);
app.use("/api/group", groupRoutes);

// Handle undefined Routes
app.use("*", (req, res, next) => {
    res.status(404).json({ error: "undefined route" });
});

module.exports = app;
