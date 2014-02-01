webserver = require './Webserver.coffee'
bp = require './BusinessPartnerService.coffee' 
us = require './UserService.coffee'

BP_SERVICE_URL = process.env.BP_SERVICE_URL or "http://localhost:7777/bps/"
USER_SERVICE_URL = process.env.USER_SERVICE_URL or "http://localhost:7777/user/"
PORT = process.env.PORT or 5555

bpService = bp.createBusinessPartnerService(BP_SERVICE_URL)
userService = us.createUserService(USER_SERVICE_URL)

webserver.createWebServer(PORT,bpService,userService)