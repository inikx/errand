const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const Project = require("../models/project");
const UsersInProject = require("../models/usersInProject");
const User = require("../models/user");

const getProjects = async (req, res) => {
    try {
        const projects = await UsersInProject.findAll(
            {
                where: {
                    user_id: req.user.user_id,
                    status:1,
                },
                include: [
                    { model: User, required: true },
                    { model: Project, required: true },
                ],
            },
            { raw: true }
        );
        const mappedProjects = projects.map((project) => {
            return { id: project.project_id, title: project.project.title };
        });
        res.status(200).json(mappedProjects);
    } catch (error) {
        console.error(error);
    }
};

const createProject = async (req, res) => {
    try {
        const project = new Project({
            title: req.body.title,
            creator: req.user.username,
        });

        await project.save();
        const addUserToProject = new UsersInProject({
            project_id: project.id,
            user_id: req.user.user_id,
            status: 1,
        });

        addUserToProject.save();
        res.status(200).json("project successfully created");
    } catch (error) {
        console.error(error);
    }
};

const updateProject = async (req, res) => {
    try {
        const { id, title } = req.body;
        const project = await Project.findOne({
            where: { creator: req.user.username },
        });

        if (project) {
            await Project.update({ title }, { where: { id } });
            res.status(200).json("group successfully updated");
        } else {
            res.status(403).json("u can't edit this group");
        }
    } catch (error) {
        console.error(error);
    }
};

const addUserToProject = async (req, res) => {
    try {
        const { user_id, project_id } = req.body;
        if (user_id === req.user.user_id) {
            res.status(409).json("this is your group");
        } else {
            const project = await Project.findOne({
                where: { creator: req.user.username, id: project_id },
            });
            console.log(project);
            if (project) {
                const user = await User.findOne({ where: { id: user_id } });
                if (user) {
                    const userInProject = await UsersInProject.findOne({
                        where: { user_id, project_id },
                    });
                    if (!userInProject) {
                        const userInProject = new UsersInProject({
                            group_id,
                            user_id,
                            status: 0,
                        });
                        userInProject.save();
                        res.status(200).json("user added");
                    } else {
                        res.status(409).json("user already in this project");
                    }
                } else {
                    res.status(404).json("user not found");
                }
            } else {
                res.status(403).json("this is not your project");
            }
        }
    } catch (error) {
        console.error(error);
    }
};

const removeProject = async (req, res) => {
    try {
        const { project_id } = req.body;
        const cacheKey = `user_projects_${req.user.user_id}`;
        const project = await Project.findOne({
            where: { id: project_id, user_id: req.user.user_id },
        });
        if (project) {
            await Project.destroy({ where: { id: project_id } });
            await redis.del(cacheKey);
            res.status(200).json("project removed successfully");
        } else {
            res.status(404).json("project not found");
        }
    } catch (error) {
        console.error(error);
    }
};

module.exports = {
    getProjects,
    createProject,
    updateProject,
    addUserToProject,
    removeProject,
};
