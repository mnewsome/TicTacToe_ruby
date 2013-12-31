class PlayerFinder

  def self.find(number_of_players, human_player="HumanPlayer")
    player_list = []
    if number_of_players == 1
      player_list << create_human_player(human_player)
    elsif number_of_players == 2
      player_list << create_human_player(human_player)
      player_list << create_human_player(human_player)
    end
  end

  private

  def self.create_human_player(human_player)
    Object.const_get(human_player).new
  end
end

