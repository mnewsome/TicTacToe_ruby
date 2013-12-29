class PlayerFinder

  def initialize
  end

  def find(number_of_players, human_player)
    player_list = Array.new
    if number_of_players == 1
      player1 = create_human_player(human_player)
      player_list << player1
    elsif number_of_players == 2
      player1 = create_human_player(human_player)
      player2 = create_human_player(human_player)
      player_list << player1
      player_list << player2
    end
  end

  def create_human_player(human_player)
    Object.const_get(human_player).new
  end
end

