require "rspec"
require "player_finder"
require "human_player"
require "computer_player"

describe PlayerFinder do

  it "return a human player object" do
    player_array = PlayerFinder.find(1)
    player_array[0].should be_instance_of HumanPlayer
  end

  it "return a human and computer player object" do
    player_array = PlayerFinder.find(1)
    player_array[0].should be_instance_of HumanPlayer
    player_array[1].should be_instance_of ComputerPlayer
  end

  it "return 2 human player objects" do
    player_array = PlayerFinder.find(2)
    player_array[0].should be_instance_of HumanPlayer
    player_array[1].should be_instance_of HumanPlayer
  end
end
