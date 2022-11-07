express = require "express"
dotenv = require "dotenv"
morgan = require "morgan"
helmet = require "helmet"
colors = require "colors"
cors = require "cors"
morgan = require "morgan"
helmet = require "helmet"
bodyParser = require "body-parser"
connectDB = require "./configs/connect.db.coffee"
userRoute = require "./routes/user.route.coffee"
dotenv.config()
app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())
app.use(morgan("dev"))
app.use(helmet())
port = process.env.PORT
connectDB()
app.use "/api/users", userRoute
app.listen port
console.log colors.green("Server running at http://localhost:#{port}")