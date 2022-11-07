mongoose = require "mongoose"
colors = require "colors"
connectDB = () ->
    try 
        await mongoose.connect(process.env.MONGODB_URI)
        console.log(colors.green("Connected to MongoDB successfully"))
    catch e
        console.log(e)
        console.log(colors.red("Connected to MongoDB failed"))

module.exports = connectDB