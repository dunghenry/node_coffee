User = require "../models/user.model.coffee"
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
               newUser = new User({name:req.body.name, email:req.body.email, password: req.body.password})
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



module.exports = userController