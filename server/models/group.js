const Sequelize = require("sequelize");
var s = require("../connectors/postgres");

const Group = s.define(
    "group",
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

Group.sync();

module.exports = Group;
