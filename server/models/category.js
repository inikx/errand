const Sequelize = require("sequelize");
var s = require("../connectors/postgres");
const Task = require("./task");

const Category = s.define(
    "category",
    {
        title: {
            // category title
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        timestamps: false,
        freezeTableName: true,
    }
);

Category.belongsTo(Task, {
    foreignKey: { name: "task_id", allowNull: false },
    onDelete: "CASCADE",
});

Category.sync();

module.exports = Category;
