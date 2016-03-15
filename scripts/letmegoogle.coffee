module.exports = (robot) ->
	robot.respond /google (.*) /i, (res) ->
		userQuery = res.match[1]
		res.reply "You want me to search for #{query} right?"