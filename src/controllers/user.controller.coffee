User = require "../models/user.model.coffee"
bcrypt = require "bcrypt"
class userController
    @getUsers: (req, res)->
        try
            users = await User.find()
            return res.status(200).json(users)    
        catch e
            console.log(e)
            return res.status(500).json({message: e.message})        
    @createUser: (req, res)->
       try
                user = await User.findOne({email: req.body.email})
                if user
                       return res.status(400).json({message: "Email already in used"})
                else
                        salt = await bcrypt.genSalt(10)
                        hashedPassword = await bcrypt.hash(req.body.password, salt)
                        newUser = new User({name:req.body.name, email:req.body.email, password: hashedPassword})
                        savedUser = await newUser.save();
                        return res.status(200).json(savedUser)
        catch e
            console.log(e)
            return res.status(500).json({message: e.message})        
    @getUser: (req, res)->
       try
               user = await User.findById(req.params.id)
               if user
                    return res.status(200).json(user)    
               else
                    return res.status(400).json({message: "User not found" })
        catch e
            console.log(e)
            return res.status(500).json({message: e.message})     
    @login:(req, res)->
       try
            user = await User.findOne({email: req.body.email})
            if user
                isValidPassword = await bcrypt.compare(req.body.password, user.password)
                if isValidPassword
                    {password, ...info} = user._doc
                    return res.status(200).json(info)
                else
                    return res.status(400).json({message: "Invalid password"})
            else
                return res.status(400).json({message: "Email already in used" })
        catch e
            console.log(e)
            return res.status(500).json({message: e.message})
             
        

        



module.exports = userController