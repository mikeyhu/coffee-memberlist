express = require 'express'

PORT = 7777
DELAY = 100
BP_SIZE = 10

app = express()
app.get '/user/:id', (req,res)->
	id = req.params.id
	writeResponse = ->
		res.json
			id:id
			email:"user#{id}@test.com"
			firstName:""
			lastName:""
	setTimeout(writeResponse,DELAY)

app.get '/bps/:bpid',(req,res)->
	result = (num for num in [1..BP_SIZE])
	res.json(result)
				
app.listen PORT, -> console.log "Fake Member Service is listening on #{PORT}\nPress CTRL-C to stop server."