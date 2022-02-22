const Sequelize = require("sequelize");
var s = require("../connectors/postgres");

const User = s.define(
    "user",
    {
        username: {
            // username a.k.a login
            type: Sequelize.STRING,
            allowNull: false,
            unique: true,
        },
        email: {
            // email
            type: Sequelize.STRING,
            allowNull: false,
            unique: true,
        },
        password: {
            // password
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

User.sync();

module.exports = User;
