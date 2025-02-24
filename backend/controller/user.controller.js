const UserService = require("../services/user.services");

exports.register = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ error: "Email and Password are required" });
        }

        await UserService.registerUser(email, password);

        res.status(201).json({ status: true, message: "User Registered Successfully" });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ error: "Email and Password are required" });
        }

        let user = await UserService.checkUser(email);
        if (!user) {
            return res.status(404).json({ error: "User does not exist" });
        }

        const isPasswordCorrect = await user.comparePassword(password);
        if (!isPasswordCorrect) {
            return res.status(401).json({ error: "Invalid credentials" });
        }

        // Creating Token
        const tokenData = { _id: user._id, email: user.email };
        const token = await UserService.generateAccessToken(tokenData, process.env.JWT_SECRET || "secret", "1h");

        res.status(200).json({ status: true, message: "Login successful", token });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
