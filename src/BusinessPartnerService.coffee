http = require 'http'
BasicService = require './BasicService.coffee'

class BusinessPartnerService extends BasicService

	getMembers:(id,fun)->
		@getById id,fun

module.exports = BusinessPartnerService