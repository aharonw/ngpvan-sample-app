express = require 'express'
router  = express.Router()


router.get '/', (req, res) ->
  res.send 'blarg blarg blarg'


module.exports = router