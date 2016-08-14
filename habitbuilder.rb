require 'sqlite3'

#create databases
data = SQLite3::Database.new ("data.db")
create_users_table_cmd = <<-MAKEUSERS
	CREATE TABLE IF NOT EXISTS users(
		id INTEGER PRIMARY KEY,
		username VARCHAR(255),
		password VARCHAR(255),
		name VARCHAR(255)
	);
	CREATE TABLE IF NOT EXISTS habits(
		id INTEGER PRIMARY KEY,
		user_id INT,
		habit VARCHAR(255),
		complete BOOLEAN,
		date DATE,
		FOREIGN KEY(user_id) REFERENCES users(id)
	);
MAKEUSERS
create_habits_table_cmd = <<-MAKEHABITS
	CREATE TABLE IF NOT EXISTS habits(
		id INTEGER PRIMARY KEY,
		user_id INT,
		habit VARCHAR(255),
		complete BOOLEAN,
		date DATE,
		FOREIGN KEY(user_id) REFERENCES users(id)
	);
MAKEHABITS
data.execute(create_users_table_cmd)
data.execute(create_habits_table_cmd)
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

#Explains what habit tracker is and how it works
def learnmore 
	currentpage = 0
	page1 = "
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║   Habit Tracker is a program that helps people build habits. Habit      ║ 
║formation is the process by which new behaviors become automatic. If you ║
║instinctively reach for a cigarette the moment you wake up in the        ║
║morning, you have a habit. By the same token, if you feel inclined to    ║
║lace up your running shoes and hit the streets as soon as you get home,  ║
║you've acquired a habit.                                                 ║
║   Old habits are hard to break and new habits are hard to form. That's  ║
║because the behavioral patterns we repeat most often are literally etched║
║into our neural pathways. The good news is that, through repetition, it's║
║possible to form—and maintain—new habits.                                ║
║                                                                         ║
║      1. Back to menu                      2. Keep reading               ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝"
	page2 = "
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║Habit Tracker helps you to:                                              ║
║Commit for a Set Time – Some research says three to four weeks is all the║
║time you need to make a habit automatic. If you can make it through the  ║
║initial conditioning phase, it becomes much easier to sustain.           ║
║                                                                         ║
║Set Reminders – Consistency is critical if you want to make a habit      ║
║stick. If you want to start exercising, go to the gym every day for your ║
║first thirty days. Going a couple times a week will make it harder to    ║
║form the habit. Activities you do once every few days are trickier to    ║
║lock in as habits.                                                       ║
║                                                                         ║
║      1. Back to menu      2. Previous Page        3. Keep reading       ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝"
	page3 = "
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║Habit Tracker helps you to:                                              ║
║Stay Consistent – The more consistent your habit the easier it will be to║
║stick. If you want to start exercising, try going at the same time, to   ║
║the same place. When cues like time of day, place and circumstances are  ║
║the same in each case it is easier to stick.                             ║
║                                                                         ║
║Get a Buddy – Find someone who will go along with you and keep you       ║
║motivated if you feel like quitting.                                     ║
║                                                                         ║  
║Make a Plan - Planing how you are going to make your behavior a lifestyle║ 
║will allow you to eliminate distractions and help you stick to your      ║
║commitments.                                                             ║
║                                                                         ║
║      1. Back to menu                      2. Previous Page              ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝"
	pages = [page1, page2, page3]
	
	exitloop = false
	until exitloop
		puts pages[currentpage]
		input = gets.chomp
		if input == "1"
			exitloop = true
			intro()		
		elsif input == "2"
			if currentpage == 0
				currentpage += 1 
			else
				currentpage -= 1
			end 
		elsif input == "3"
			if currentpage == 1
				currentpage += 1 
			else
				puts "Enter 1 to go to the main menu or 2 to continue reading about Habit Tracker."
			end
		else
			if currentpage == 0
				puts "Enter 1 to go to the main menu or 2 to continue reading about Habit Tracker."
			elsif currentpage == 1
				puts "Enter 1 to go to the main menu, 2 to go to the previous page, or 3 to continue reading about Habit Tracker."
			elsif currentpage == 2
				puts "Enter 1 to go to the main menu or 2 to go to the previous page."	
			end 					
		end	
	end	
end

def login
	puts "what is your user name?"
	username = gets.chomp.downcase

	puts "what is your password?"
	password = gets.chomp.downcase
end

def welcome
end

def newuser(data)
	puts "Welclome to Habit Tracker. Before we get started let's get some information."
	
	validinput = false
	until validinput
		puts "What should we call you?"
		name = gets.chomp
		puts "Are you happy with #{name}?"
		confirm = gets.chomp.downcase
		if confirm == "yes"
			validinput = true
		elsif "no"
		else
			"Please enter either yes or no."
		end 	
	end

	validinput = false
	until validinput
		puts "Nice to meet you #{name}. What username would you like to login with?"
		user = gets.chomp
		puts "Are you happy with #{user}?"
		confirm = gets.chomp.downcase
		if confirm == "yes"
			validinput = true
		elsif "no"
		else
			"Please enter either yes or no."
		end 	
	end

	validinput = false
	until validinput
		puts "What password woudld you like to use #{name}?"
		password = gets.chomp
		puts "Please retype the password to confirm."
		password2 = gets.chomp
		if password == password2
			data.execute("INSERT INTO users (name, username, password) VALUES (?, ?, ?)", [name, user, password])
		 	validinput =true
		else
			"Those passwords did not match. Please try again."
		end 	
	end

end
#intro options
#create account
#sign in
#about
def intro(data)
	puts"
╔═════════════════════════════════════════════════════════════════════════╗
║                                                                         ║
║#{"WELCOME TO HABIT TRACKER".center(73)}║
║                                                                         ║"
insertquote()
puts"║                                                                         ║
║                                                                         ║
║                                                                         ║
║                  1. Create New Account                                  ║
║                  2. Login to Existing Account                           ║
║                  3. Learn More About Habit Tracker                      ║
║                                                                         ║
╚═════════════════════════════════════════════════════════════════════════╝"
	validinput = false

	until validinput
	 	input = gets.chomp
		if input == "1"
			validinput = true
			newuser(data)		
		elsif input == "2"
			validinput = true
		elsif input == "3"
			validinput = true
			learnmore()
		else
			puts "Enter 1 to create an account, 2 to log into your account, or 3 to learn about how Habit Tracker works."
		end		
	end 
end

intro(data)