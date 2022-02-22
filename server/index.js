const s = require("./connectors/postgres");
const app = require("./app");

const port = 3000;

s.authenticate()
    .then(() => {
        console.log("Connection has been established successfully.");
    })
    .catch((err) => {
        console.error("Unable to connect to the database:", err);
    });

app.get("/", (req, res) =>
    res.json({ message: "tasker api" })
);

app.listen(port, () => console.log(`rs Calendar API started on ${port}!`));

module.exports = app