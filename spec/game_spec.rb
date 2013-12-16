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
      @game.select_token.should eq "x"
    end
  end

  describe "#is_token_valid? check X is true" do
    it "should be true" do
      @game.is_token_valid?("X").should eq true
    end
  end

  describe "#is_token_valid? check O is true" do
    it "should be true" do
      @game.is_token_valid?("O").should eq true
    end
  end
  
  describe "#is_token_valid? check false" do
    it "should be false" do
      @game.is_token_valid?("f").should eq  false
    end
  end

end
