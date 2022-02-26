const Sequelize = require("sequelize");
var s = require("../connectors/postgres");

const Project = s.define(
    "project",
    {
        title: {
            // group title
            type: Sequelize.STRING,
            allowNull: false,
        },
        creator: {
            // creator username
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

Project.sync();

module.exports = Project;
