# lets have some key things to listen for and keep track of

module.exports = (robot) ->

	GtfsRealtimeBindings = require('gtfs-realtime-bindings')
	request = require('request')
	requestSettings = 
  		method: 'GET'
  		url: 'URL OF YOUR GTFS-REALTIME SOURCE GOES HERE'
  		encoding: null
	request requestSettings, (error, response, body) ->
  	if !error and response.statusCode == 200
    	feed = GtfsRealtimeBindings.FeedMessage.decode(body)
    	feed.entity.forEach (entity) ->
      	if entity.trip_update
        	console.log entity.trip_update
      	return
  	return