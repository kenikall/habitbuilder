#create user database
#get user name 
#get user password

#allow user to create new account
#get name 
#get password
#verify password
#get goals

#create user interface
#allow users to see their goals
#allow users to see their progress
#add new goals

#allow users to update their progress
#offer badges when users reach milestones

#encourage others

#intro options
#create account
#sign in
#about
def insertquote
	quote1 = "║#{"We are what we repeatedly do. Excellence,".center(73)}║
		\r║#{"then, is not an act but a habit.".center(73)}║
		\r║#{                         "-Aristotle".center(73)}║
		\r║                                                                         ║"
	quote2 = "║#{"If you are going to achieve excellence in big things,".center(73)}║
		\r║#{"you develop the habit in little matters. Excellence is not".center(73)}║
		\r║#{"an exception, it is a prevailing attitude.      ".center(73)}║
		\r║#{                         "-Colin Powell".center(73)}║"
	quote3 = "║#{"Winners make a habit of manufacturing their own positive".center(73)}║
		\r║#{"expectations in advance of the event.".center(73)}║
		\r║#{                         "-Brian Tracy".center(73)}║
		\r║                                                                         ║"
	quote4 = "║#{"Creativity is a habit, and the best creativity is the".center(73)}║
		\r║#{"result of good work habits.".center(73)}║
		\r║#{                         "-Twyla Tharp".center(73)}║
		\r║                                                                         ║"
	quotes=[quote1,quote2,quote3,quote4]
	puts quotes[rand(4)]
end
puts"
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║#{"WELCOME TO HABIT TRACKER".center(73)}║
║                                                                         ║"
insertquote()
puts"║                                                                         ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝"
puts " test1 \r test2 \n test3"

# ║╔╚═╝╗