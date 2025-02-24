const UserModel = require("../models/user.model");
const jwt = require("jsonwebtoken");

class UserService {
    // Register user
    static async registerUser(email, password) {
        try {
            console.log("----- Registering User -----", email, password);

            const existingUser = await UserModel.findOne({ email });
            if (existingUser) {
                throw new Error("User already exists with this email.");
            }

            const newUser = new UserModel({ email, password });
            await newUser.save();
            return newUser;
        } catch (err) {
            throw err;
        }
    }

    // Get user by email
    static async getUserByEmail(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (err) {
            throw new Error("Error fetching user by email");
        }
    }

    // Check if user exists
    static async checkUser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (error) {
            throw new Error("Error checking user");
        }
    }

    // Generate JWT Token
    static async generateAccessToken(tokenData, JWTSecret_Key, JWT_EXPIRE) {
        try {
            return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
        } catch (error) {
            throw new Error("Token generation failed");
        }
    }
}

module.exports = UserService;
