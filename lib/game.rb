class Game 

	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
		@players = [@player1, @player2]
	end

	BEATS = {rock: [:scissors, :ninja], scissors: [:paper, :ninja], paper: [:rock, :samurai], ninja: [:samurai, :paper], samurai: [:scissors, :rock]}

	attr_reader :players, :player1, :player2

	def winner
		return "Draw" if player1.pick == player2.pick
		return player1  if BEATS[normalize(player1.pick)].include?(normalize(player2.pick))
		player2
	end

	def normalize(pick)
		pick.downcase.to_sym
	end

	def victory
		if winner.pick == "Rock" 
			"crushes"
		elsif winner.pick == "Scissors"
			"cuts"
		elsif winner.pick == "Paper"
			"covers"
		elsif winner.pick == "Ninja"
			"poisons"
		elsif winner.pick == "Samurai"
			"throws"
		end
	end
end