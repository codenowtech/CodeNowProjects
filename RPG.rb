#Methods

def create_player(players, player_type, player_name) 
#Based on which character they picked, they start with a certain number of red, white, and black beads.
#Regardless of what character they picked, all players start at level 1
	if player_type == "warrior"
		players[player_name] = {"red_beads" => 1, "white_beads" => 2, "black_beads" => 3, "level" => 1, "wins" => 0}
	elsif player_type == "princess warrior"
		players[player_name] = {"red_beads" => 1, "white_beads" => 2, "black_beads" => 3, "level" => 1, "wins" => 0}
	elsif player_type == "wizard"
		players[player_name] = {"red_beads" => 1, "white_beads" => 2, "black_beads" => 3, "level" => 1, "wins" => 0}
  elsif player_type == "pirate"
		players[player_name] = {"red_beads" => 1, "white_beads" => 2, "black_beads" => 3, "level" => 1, "wins" => 0}
	end
end


def challenge(challengers, player_name)
	#Secretly each players puts 1 or more beads in their right hand
	puts "Choose your beads, red?"
	red_beads = gets.chomp.to_i
	puts "Choose your beads, white?"
	white_beads = gets.chomp.to_i
	puts "Choose your beads, black?"
	black_beads = gets.chomp.to_i
	#calculate score: each player gets 1 point per bead + his/her current level
	score = red_beads + white_beads + black_beads
	challengers[player_name] = {"red_beads" => red_beads, "white_beads" => white_beads, "black_beads" => black_beads, "score" => score}
end


def reveal(challengers)
	#output name of player and beads selected for both players
	#calculate score and choose winner
	#Each player gets 1 point per bead + his/her current level
 	#In the event of a tie, players repeat the challenge
  score = 0
  winner = ""
  challengers.each_pair do |key, value| 
    puts "#{key}: Score: #{value["score"]}, Red: #{value["red_beads"]}, White: #{value["white_beads"]}, Black: #{value["black_beads"]}"
	#figure out winner
    if score < value["score"]
      score = value["score"]
      winner = key
    end
	end
  return winner
end

def divide_the_loot(players, challengers, winner)
#show the pool of beads, ask to divide the pool into 2 equal piles
#All beads involved in the challenge go into a pool. The winner of the challenge divides into 2 equal piles.
#If there are an odd number of beads, one pile will have 1 extra bead
#print "piles"; ask winner to choose pile
#The winner of the challenge takes one of the piles and the loser gets the other pile of beads.
  red_loot = 0
  white_loot = 0
  black_loot = 0
  challengers.each_value do |value|
    red_loot = red_loot + value["red_beads"]
    white_loot = white_loot + value["white_beads"]
    black_loot = black_loot + value["black_beads"]
  end
  total_loot = red_loot + white_loot + black_loot
  winner_loot = total_loot / 2
  puts "There are #{red_loot} red beads, #{white_loot} white beads, and #{black_loot} black beads."
  puts "#{winner} you can choose #{winner_loot} beads."
  puts "Make your choice:"
  puts "Red beads?"
  winner_red = gets.chomp.to_i
  players[winner]["red_beads"] = players[winner]["red_beads"] + winner_red
  puts "White beads?"
  winner_white = gets.chomp.to_i
  players[winner]["white_beads"] = players[winner]["white_beads"] + winner_white
  puts "Black beads?"
  winner_black = gets.chomp.to_i
  players[winner]["black_beads"] = players[winner]["black_beads"] + winner_black
end

#Main Program

players = {}
challengers = {}
counter_players = 0
counter_challengers = 0

#Pick number of players and create players
puts "How many players?"
num_of_players = gets.chomp.to_i
while counter_players < num_of_players 
  puts counter_players
  counter_players = counter_players + 1
	#Players pick one of 3 characters
	puts "What are you: warrior, princess warrior, wizard, pirate?"
	player_type = gets.chomp
	puts "Who are you?"
	player_name = gets.chomp
	create_player(players, player_type, player_name)
end

players.each_pair do |key, value|
  puts "Player: #{key} has #{value["red_beads"]} red beads, #{value["white_beads"]} white beads, #{value["black_beads"]} black beads"
end

#clear the screen
puts "Let's begin"

#Pick number of challengers and select beads
puts "How many challengers"
num_of_challengers = gets.chomp.to_i
while counter_challengers < num_of_challengers
  counter_challengers = counter_challengers + 1
	puts "Who are you?"
	player_name = gets.chomp
  challenge(challengers, player_name)
end

challengers.each_pair do |key, value|
  puts "Player: #{key} has choosen #{value["red_beads"]} red beads, #{value["white_beads"]} white beads, #{value["black_beads"]} black beads"
end


#clear the screen
puts "Reveal!"

#Simultaneously players reveal their beads
winner = reveal(challengers)
puts "Congratulations #{winner}!"

divide_the_loot(players, challengers, winner)

players.each_pair do |key, value|
  puts "Player: #{key} has #{value["red_beads"]} red beads, #{value["white_beads"]} white beads, #{value["black_beads"]} black beads"
end

#Once a player has “won” 5 times, his/her level increases by 1 and he/she gains a bead of the color according to his/her character.
