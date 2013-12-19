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
      ui = double()
      @player.ui = ui
      ui.should_receive(:get_input).once.with("#{@player.name}, choose your space").and_return(2)
      @player.move
    end
  end

end

