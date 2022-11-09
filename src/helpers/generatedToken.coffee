jwt = require "jsonwebtoken"

generatedAccessToken = (user) ->
    return jwt.sign({
        userId: user._id,
    },
    process.env.ACCESS_TOKEN_SECRET
    ,{ expiresIn: '5h' })

generatedRefreshToken = (user) ->
    return jwt.sign({
        userId: user._id,
    },
    process.env.REFRESH_TOKEN_SECRET
    ,{ expiresIn: '365d' })


module.exports = {generatedAccessToken, generatedRefreshToken}