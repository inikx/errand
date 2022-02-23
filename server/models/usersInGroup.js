const Sequelize = require("sequelize");
var s = require("../connectors/postgres");
const User = require("./user");
const Group = require("./group");

const UsersInGroup = s.define(
    "users_in_group",
    {
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

UsersInGroup.belongsTo(Group, {
    foreignKey: { name: "group_id", allowNull: false },
    onDelete: "CASCADE",
});

UsersInGroup.belongsTo(User, {
    foreignKey: { name: "user_id", allowNull: false },
    onDelete: "CASCADE",
});

UsersInGroup.sync();

module.exports = UsersInGroup;
