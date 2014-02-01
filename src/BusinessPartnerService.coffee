http = require 'http'
url = require 'url'

exports.createBusinessPartnerService = (bpServiceUrl)->

	getMembers:(bpid,fun)->
		data = ""
		req = http.get bpServiceUrl+bpid, (res) ->
			res.setEncoding('utf8')
			res.on 'data', (chunk)->
				data = data + chunk
			res.on 'end', ()->
				fun(null,JSON.parse(data))
		.on 'error', (e)->	
			fun(e.message,null)
		req.end()