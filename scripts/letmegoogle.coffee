# this takes the users query and creates a tinyurl of the let me google that webpage. 


module.exports = (robot) ->

	robot.respond /google (.*)/i, (res) ->
		totalJerk = Math.random()
		if totalJerk > 0.5
			userQuery = res.match[1]
			newQuery = userQuery.replace(/\ /g,"+")
			res.http("http://tinyurl.com/api-create.php?url=http://lmgtfy.com/?q=" + newQuery)
				.get() (error, response, body) ->
					res.reply body
		if totalJerk < 0.5
			userQuery = res.match[1]
			newQuery = userQuery.replace(/\ /g,"+")
			res.http("http://tinyurl.com/api-create.php?url=http://google.com/search?q=" + newQuery)
				.get() (error, response, body) ->
					res.reply body

	enterPhrases = ['I see you','Oh look its old so and so','My body is ready']
	leavePhrases = ['I\'ve always hated that guy','Seriously though, miss that guy','Shut up bye already']

	robot.enter (res) ->
		res.send res.random enterPhrases
	robot.leave (res) ->
		res.send res.random leavePhrases

	robot.hear /my boy searchbot/i (res) ->
		res.send "thats me what up"

	