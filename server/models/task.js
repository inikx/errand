const Sequelize = require("sequelize");
var s = require("../connectors/postgres");
const User = require("./user");
const Project = require("./project");

const Task = s.define(
    "task",
    {
        title: {
            // task title
            type: Sequelize.STRING,
            allowNull: false,
        },
        description: {
            type: Sequelize.TEXT,
            allowNull: true,
        },
        date: {
            // date
            type: Sequelize.DATE,
            allowNull: true,
        },
        status: {
            type: Sequelize.INTEGER,
            allowNull: false,
        },
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

Task.belongsTo(User, {
    foreignKey: { name: "user_id", allowNull: true },
    onDelete: "CASCADE",
});

Task.belongsTo(User, {
    foreignKey: { name: "creator_id", allowNull: false },
    onDelete: "CASCADE",
});

Task.belongsTo(Project, {
    foreignKey: { name: "project_id", allowNull: true },
    onDelete: "CASCADE",
});

Task.sync();

module.exports = Task;
