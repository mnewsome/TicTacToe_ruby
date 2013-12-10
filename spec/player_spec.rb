require 'spec_helper'
require 'player'

describe Player do
  before(:each) do
    @player = Player.new("x")
  end

  describe "#new" do
    it "should take one parameter and return a Player oject" do
      @player.should be_an_instance_of Player
    end
  end

  describe "#move" do
    it "should return the player move" do
      @player.move = 1
      @player.should_not be_nil
    end
  end

end

