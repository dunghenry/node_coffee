express = require "express"
app = express()
port = 4000
app.get "/", (req, res) ->
    res.send("Hi")

app.listen port

console.log "Server running at http://localhost:#{port}"