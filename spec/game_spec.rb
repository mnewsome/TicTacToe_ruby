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

  describe "#select_mark check X" do
    it "should return 'x'" do
      @game.select_mark("Select X").should eq "x"
    end
  end

  describe "#is_mark_valid? check X is true" do
    it "should be true" do
      @game.is_mark_valid?("X").should eq true
    end
  end

  describe "#is_mark_valid? check O is true" do
    it "should be true" do
      @game.is_mark_valid?("O").should eq true
    end
  end

  describe "#is_mark_valid? check false" do
    it "should be false" do
      @game.is_mark_valid?("f").should eq false
    end
  end

  describe "#game_over test player x win" do
    it "should return X as the winner" do
      @game.game_over("x").should eq "x wins!"
    end
  end

  describe "#game_over test player o win" do
    it "should retun O as the winner" do
      @game.game_over("o").should eq "o wins!"
    end
  end

  describe "#game_over test tie" do
    it "should return a tie game" do
      @game.game_over("").should eq "Tie game!"
    end
  end

  describe "#is_move_valid? test true" do
    it "should return true" do
      @game.is_move_valid?(9).should eq true
    end
  end
end
