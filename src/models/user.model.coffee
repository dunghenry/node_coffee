{Schema, model} = require('mongoose');
userSchema = new Schema({
    name: {
        type: String
        required: true
    },
    email:{
        type: String,
        required: true,
    },
    password:{
        type: String,
        required: true
    }
},{
    timestamps: true
})

User = model('User', userSchema)

module.exports = User