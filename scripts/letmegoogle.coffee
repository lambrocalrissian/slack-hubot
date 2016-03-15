module.export = (robot) ->
	robot.respond /google (.*)/i, (res) ->
		query = res.match[1]
		res.reply "You want me to search for #{query} right?"