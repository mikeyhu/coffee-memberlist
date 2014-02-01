http = require 'http'
url = require 'url'

exports.createUserService = (serviceUrl)->
	
	getUserInformation:(userList,fun)->

		checkFinished = (err,data)->
			console.log "Error: #{err}" if err
			console.log "Ending:#{data.id}"
			finishedList.push data
			console.log("finishedList.size:#{finishedList.length} expected:#{userList.length}")
			if finishedList.length == userList.length
				fun(null,finishedList)

		finishedList = []

		@getSingleUser(id,checkFinished) for id in userList

	getSingleUser:(id,fun)->
		console.log "Starting:#{id}"
		data = ""
		req = http.get serviceUrl+id, (res) ->
			res.setEncoding('utf8')
			res.on 'data', (chunk)->
				data = data + chunk
			res.on 'end', ()->
				fun(null,JSON.parse(data))
		.on 'error', (e)->	
			fun(e.message,null)
		req.end()