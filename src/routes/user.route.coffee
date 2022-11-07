{Router} = require "express"
router = Router()
userController = require "../controllers/user.controller.coffee"
router.get "/", userController.getUsers
router.post "/", userController.createUser
router.get "/:id", userController.getUser
module.exports = router