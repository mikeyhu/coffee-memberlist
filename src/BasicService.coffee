http = require 'http'

class BasicService
	constructor:(@serviceUrl)->

	getById:(id,fun)->
		console.log "#{@constructor.name} - requesting: #{id}"
		data = ""
		req = http.get @serviceUrl+id, (res) =>
			res.setEncoding('utf8')
			res.on 'data', (chunk)->
				data = data + chunk
			res.on 'end', ()=>
				console.log "#{@constructor.name} - finishing: #{id}"
				fun(null,JSON.parse(data))
		.on 'error', (e)->	
			fun(e.message,null)
		req.end()

module.exports = BasicService