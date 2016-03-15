# This script will have Hubot return a let me google that for you link that should serve 
# some funny happy times. 


module.exports = (robot) ->

	robot.respond /google (.*)/i, (res) ->
		userQuery = res.match[1]
		res.reply "so you want me to google #{}?"