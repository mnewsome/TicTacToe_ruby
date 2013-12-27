require "rspec"
require "player_finder"

describe PlayerFinder do

  before(:each) do
    HumanPlayer = "HumanPlayer"
    @player_finder = PlayerFinder.new(HumanPlayer)
  end

  it "return a human player object" do
   @player_finder.find(1, HumanPlayer).should == [HumanPlayer]
  end

  it "return 2 human player objects" do
    @player_finder.find(2, HumanPlayer).should == [HumanPlayer, HumanPlayer]
  end
end
