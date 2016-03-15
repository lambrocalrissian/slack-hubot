# This script will have Hubot return a let me google that for you link that should serve 
# some funny happy times. 


module.exports = (robot) ->

	robot.respond /google (.*)/i, (res) ->
		userQuery = res.match[1]
		newQuery = userQuery.replace(/\ /g,"+")
		tinyUrl = "http://tinyurl.com/api-create.php?url=http://lmgtfy.com/?q=" + newQuery
		res.reply tinyUrl.get(body)