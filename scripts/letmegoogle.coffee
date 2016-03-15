# This script will have Hubot return a let me google that for you link that should serve 
# some funny happy times. 


module.exports = (robot) ->
	
	robot.hear /google/ (res) ->
		res.send "Google your own shit."