express      = require 'express'
path         = require 'path'
favicon      = require 'static-favicon'
logger       = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser   = require 'body-parser'

routes = require './routes/index'
users  = require './routes/users'

app = express()

app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

app.use favicon()
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use require('node-sass').middleware({
  src:   path.join(__dirname, 'styles'),
  dest:  path.join(__dirname, 'public'),
  debug: true,
  outputStyle: 'compressed'
  })
app.use express.static path.join __dirname, 'public'

app.use '/', routes
app.use '/users', users

server = app.listen 3000, ->
  console.log 'Listening on port %d', server.address().port

module.exports = app