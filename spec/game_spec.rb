require 'spec_helper'
require 'game'

describe Game do
  before(:each) do
    @game = Game.new
  end

  describe "#new" do
    it "should return a game object" do
      @game.should be_an_instance_of Game
    end
  end

end
