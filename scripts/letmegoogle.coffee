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
	robot.respond /gif (.*)/i, (res) ->
		userQuery = res.match[1]
		
	enterReplies = ['Searchbot online', 'Well hello there','Ok shut up whatever I\'m here']
	leaveReplies = ['Searchbot powering down','Goodnight byebye','I\'m leaving this shithole']

	robot.enter(res) ->
		res.send res.random enterReplies
	robot.leave(res) ->
		res.send res.random leaveReplies 
	