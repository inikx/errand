const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const User = require("../models/user");
const Sequelize = require("sequelize");
const Op = Sequelize.Op;

const { check, validationResult } = require("express-validator/check");

const register = async (req, res) => {
    try {
        const { username, email, password } = req.body;
        var user = await User.findOne({
            where: { [Op.or]: [{ username: username }, { email: email }] },
        });
        var nickname_filter = /^[A-Za-z0-9]+([A-Za-z0-9]*|[._-]?[A-Za-z0-9]+)*$/;
        if (user) {
            res.status(409).json("user already exists");
            return;
        }
        if (!nickname_filter.test(username)){
            res.status(409).json({errors: "vi dolbaeb"});
            return;
        }
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        var encryptedPassword = await bcrypt.hash(password, 10);
        user = new User({
            username,
            email: email.toLowerCase(),
            password: encryptedPassword,
        });
        await user.save();

        res.status(201).json(user);
    } catch (error) {
        console.error(error);
        res.status(500).json("server error");
    }
};

const login = async (req, res) => {
    try {
        const { username, password } = req.body;

        if (!(username && password)) {
            res.status(400).json("all inputs is required");
            return;
        }

        const user = await User.findOne({ where: { username: username } });
        if (user && (await bcrypt.compare(password, user.password))) {
            // create token
            const token = jwt.sign(
                { user_id: user.id, username },
                process.env.TOKEN_KEY,
                {
                    expiresIn: "24h",
                }
            );
            user.token = token;

            // return user
            res.status(200).json({
                token,
            });
            return;
        }
        res.status(400).json("invalid credentials");
    } catch (error) {
        console.error(error);
        res.status(500).json("server error");
    }
};

module.exports = {
    register,
    login,
};
