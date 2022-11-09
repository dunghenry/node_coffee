{Router} = require "express"
router = Router()
verifyToken = require "../middleware/verifyToken.coffee"
userController = require "../controllers/user.controller.coffee"
router.get "/", verifyToken, userController.getUsers
router.post "/", userController.createUser
router.get "/:id", verifyToken, userController.getUser
router.delete "/:id", verifyToken, userController.deleteUser
router.put "/:id", verifyToken, userController.updateUser
router.post "/login", userController.login
module.exports = router