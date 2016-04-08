# this takes the users query and creates a tinyurl of the let me google that webpage. 


module.exports = (robot) ->

	robot.respond /google (.*)/i, (res) ->
		totalJerk = Math.random()
		if totalJerk > 0.8
			userQuery = res.match[1]
			newQuery = userQuery.replace(/\ /g,"+")
			res.http("http://tinyurl.com/api-create.php?url=http://lmgtfy.com/?q=" + newQuery)
				.get() (error, response, body) ->
					res.reply body
		if totalJerk < 0.8
			userQuery = res.match[1]
			newQuery = userQuery.replace(/\ /g,"+")
			res.http("http://tinyurl.com/api-create.php?url=http://google.com/search?q=" + newQuery)
				.get() (error, response, body) ->
					res.reply body

	enterPhrases = ['Searchbot online','Yes I\'m here what','Let me google that shit']
	leavePhrases = ['Searchbot offline','Shut it all down','Shut up bye']

	robot.enter (res) ->
		res.send res.random enterPhrases
	robot.leave (res) ->
		res.send res.random leavePhrases