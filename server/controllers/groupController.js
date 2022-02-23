const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const Group = require("../models/group");
const UsersInGroup = require("../models/usersInGroup");
const User = require("../models/user");

const getGroups = async (req, res) => {
    try {
        const groups = await UsersInGroup.findAll(
            {
                where: {
                    user_id: req.user.user_id,
                },
                include: [
                    { model: User, required: true },
                    { model: Group, required: true },
                ],
            },
            { raw: true }
        );
        const mappedGroups = groups.map((group) => {
            return { id: group.group_id, title: group.group.title };
        });
        res.status(200).json(mappedGroups);
    } catch (error) {
        console.error(error);
    }
};

const getAllUsersInTheGroup = async (req, res) => {};

const createGroup = async (req, res) => {
    try {
        const group = new Group({
            title: req.body.title,
            creator: req.user.username,
        });

        await group.save();
        const addUserToGroup = new UsersInGroup({
            group_id: group.id,
            user_id: req.user.user_id,
        });

        addUserToGroup.save();
        res.status(200).json("group successfully created");
    } catch (error) {
        console.error(error);
    }
};

const updateGroup = async (req, res) => {
    try {
        const { id, title } = req.body;
        const group = await Group.findOne({
            where: { creator: req.user.username },
        });

        if (group) {
            await Group.update({ title }, { where: { id } });
            res.status(200).json("group successfully updated");
        } else {
            res.status(403).json("u can't edit this group");
        }
    } catch (error) {
        console.error(error);
    }
};

const addUserToGroup = async (req, res) => {
    try {
        const { user_id, group_id } = req.body;
        if (user_id === req.user.user_id) {
            res.status(409).json("this is your group");
        } else {
            const group = await Group.findOne({
                where: { creator: req.user.username, id: group_id },
            });
            console.log(group);
            if (group) {
                const user = await User.findOne({ where: { id: user_id } });
                if (user) {
                    const userInGroup = await UsersInGroup.findOne({
                        where: { user_id, group_id },
                    });
                    if (!userInGroup) {
                        const userInGroup = new UsersInGroup({
                            group_id,
                            user_id,
                        });
                        userInGroup.save();
                        res.status(200).json("user added");
                    } else {
                        res.status(409).json("user already in this group");
                    }
                } else {
                    res.status(404).json("user not found");
                }
            } else {
                res.status(403).json("this is not your group");
            }
        }
    } catch (error) {
        console.error(error);
    }
};

const removeGroup = async (req, res) => {
    try {
    } catch (error) {
        console.error(error);
    }
};

module.exports = {
    getGroups,
    createGroup,
    updateGroup,
    addUserToGroup,
    removeGroup,
};
