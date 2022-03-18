const Sequelize = require("sequelize");
var s = require("../connectors/postgres");
const User = require("./user");
const Project = require("./project");

const UsersInProject = s.define(
    "users_in_project",
    {
        status: {
            type: Sequelize.INTEGER,
            allowNull: false,
        }  
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

UsersInProject.belongsTo(Project, {
    foreignKey: { name: "project_id", allowNull: false },
    onDelete: "CASCADE",
});

UsersInProject.belongsTo(User, {
    foreignKey: { name: "user_id", allowNull: false },
    onDelete: "CASCADE",
});

UsersInProject.sync();

module.exports = UsersInProject;
