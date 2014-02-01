express = require 'express'

exports.createWebServer = (port,bpService,userService)->
	
	app = express()

	app.get '/members/:bpid', (req, res)->
		startTime = new Date()
		bpid = req.params.bpid
		bpService.getMembers bpid,(err,result)=>
			userService.getUserInformation result,(err,result)=>
				res.json
					timeTaken: new Date() - startTime
					members:result

	app.listen port, -> console.log "Server is listening on #{port}\nPress CTRL-C to stop server."