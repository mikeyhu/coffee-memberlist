http = require 'http'
BasicService = require './BasicService.coffee'
_ = require 'underscore'

class UserService extends BasicService

	getUserInformation:(userList,fun)->

		checkFinished = (user)->(err,data)->
			console.log "Error: #{err}" if err
			finishedList.push _.extend user,data
			if finishedList.length == userList.length
				fun(null,finishedList)

		finishedList = []

		@getById(user.id,checkFinished(user)) for user in userList

module.exports = UserService