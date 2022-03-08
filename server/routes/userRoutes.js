const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const { body, validationResult } = require('express-validator');

// Get user from database
router.post("/register", body('email').isEmail(), body('username').isLength({ min: 5, max: 25 }), body('password').isLength({ min: 5, max: 25 }),  userController.register);
router.post("/login", userController.login);

module.exports = router;