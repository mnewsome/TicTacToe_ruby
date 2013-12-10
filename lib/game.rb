require 'board'

class Game

  def initialize
    @board = Board.new(9)
  end

  def start_new_game
    puts "welcome to tic"
  end

end

if __FILE__ == $0
  game = Game.new
  game.start_new_game

end
