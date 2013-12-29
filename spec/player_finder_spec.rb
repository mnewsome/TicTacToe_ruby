require "rspec"
require "player_finder"
require "human_player"

describe PlayerFinder do

  it "return a human player object" do
    test_array = PlayerFinder.new.find(1, "HumanPlayer")
    test_array[0].should be_instance_of HumanPlayer
  end

  it "return 2 human player objects" do
    test_array = PlayerFinder.new.find(2, "HumanPlayer")
    test_array[0].should be_instance_of HumanPlayer
    test_array[1].should be_instance_of HumanPlayer
  end
end
