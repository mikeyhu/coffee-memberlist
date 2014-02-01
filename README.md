Coffee-memberlist
=================

This is an example application showing Node.js async http requests. The basic idea is to have a service that makes multiple simultaneous requests to another service it is dependant on.

In this case there is a fake dependency, the FakeSIMServices, that has has a customisable number of requests and delay before returning a response. It should be possible to profile how Node.js acts in different scenarios by changing these options.

To run:

	coffee test/FakeSIMServices.coffee &
	coffee src/App.coffee
