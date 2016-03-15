# this takes the users query and creates a tinyurl of the let me google that webpage. 


module.exports = (robot) ->

	robot.respond /google (.*)/i, (res) ->
		userQuery = res.match[1]
		newQuery = userQuery.replace(/\ /g,"+")
		res.http("http://tinyurl.com/api-create.php?url=http://lmgtfy.com/?q=" + newQuery)
			.get() (error, response, body) ->
				res.reply body