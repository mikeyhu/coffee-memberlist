http = require 'http'
BasicService = require './BasicService.coffee'

class UserService extends BasicService

	getUserInformation:(userList,fun)->

		checkFinished = (err,data)->
			console.log "Error: #{err}" if err
			console.log "Ending:#{data.id}"
			finishedList.push data
			if finishedList.length == userList.length
				fun(null,finishedList)

		finishedList = []

		@getById(id,checkFinished) for id in userList

module.exports = UserService