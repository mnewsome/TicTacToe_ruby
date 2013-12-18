require 'spec_helper'
require 'player'

describe Player do
  before(:each) do
    @player = Player.new("x", "Player Name")
  end

  describe "#new" do
    it "should take one parameter and return a Player oject" do
      @player.should be_an_instance_of Player
    end
  end

  describe "#move" do
    it "should return the player move" do
      input = 7
      puts "type a 7"
      @player.move.should eq input
    end
  end

end

