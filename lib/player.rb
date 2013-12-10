class Player

  attr_reader :player_token
  attr_accessor :move

  def initialize(token)
    @player_token = token
  end

end
