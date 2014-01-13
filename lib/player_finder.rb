class PlayerFinder

  def self.find(number_of_players, human_player="HumanPlayer", computer_player="ComputerPlayer")
    player_list = []
    if number_of_players == 1
      player_list << create_player(human_player)
      player_list << create_player(computer_player)
    elsif number_of_players == 2
      player_list << create_player(human_player)
      player_list << create_player(human_player)
    end
  end

  private

  def self.create_player(player_type)
    Object.const_get(player_type).new
  end
end

