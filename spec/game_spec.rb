require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new(Board.new(9), UI.new)
  end

  describe "#new" do
    it "should return a game object" do
      @game.should be_an_instance_of Game
    end
  end

  describe "#select_token check X" do
    it "should return 'x'" do
      #@game.token = 'X'
      @game.select_token.should eq "x"
    end
  end

end
