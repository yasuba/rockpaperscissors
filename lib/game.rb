class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @players = [@player1, @player2]
  end

  BEATS = {rock: {scissors: "crushes", ninja: "trips up"}, scissors: {paper: "cut", ninja: "blind"}, paper: {rock: "covers", samurai: "cuts little finger of"}, ninja: {samurai: "poisons", paper: "makes origami out of"}, samurai: {scissors: "smashes", rock: "throws"}}

  attr_reader :players, :player1, :player2

  def winner
    return draw if !BEATS[normalize(player1.pick)][normalize(player2.pick)] && !BEATS[normalize(player2.pick)][normalize(player1.pick)]
    return player1  if BEATS[normalize(player1.pick)][normalize(player2.pick)]
    player2
  end

  def loser
    winner == player1 ? player2 : player1
  end

  def normalize(pick)
    pick.downcase.to_sym
  end

  def message
    return "It was a draw" if winner.name == "Draw"
    return "You win! " + winner.pick + " " + BEATS[normalize(winner.pick)][normalize(loser.pick)] + " " + loser.pick if winner == player1
    "You lose! " + winner.pick + " " + BEATS[normalize(winner.pick)][normalize(loser.pick)] + " " + loser.pick
  end

  def draw
    Struct.new(:name).new("Draw")
  end

end