const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const db = require('../config/db');

const {Schema} = mongoose;
const userSchema  = new Schema({
    email:{
        type:String,
        lowercase:true,
        require:true,
        unique:true

    },
    password:{
        type:String,
        require:true
    }
});

userSchema.pre('save',async function(){
    try{
        var user  =this;
        const salt = await(bcrypt.genSalt(10));

        const hashpass = await  bcrypt.hash(user.password,salt);

        user.password = hashpass;
    }
    catch(err)
    {
throw err;
    }
});

const UserModel = db.model('user',userSchema);

module.exports =UserModel;