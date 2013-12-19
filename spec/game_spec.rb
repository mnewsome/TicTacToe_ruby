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

  describe "#instructions" do
    it "should print the game instructions" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:print_message).once.with("Press the number that corresponds to the space you'd like.")
      @game.instructions
    end
  end

  describe "#create_players" do
    it "should accept a 1 as input" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).once.with("How many players are playing? (1 or 2) ").and_return(1)
      @game.stub(:assign_players)
      @game.create_players
    end

    it "should accept 2 as input" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).once.with("How many players are playing? (1 or 2) ").and_return(2)
      @game.stub(:assign_players)
      @game.create_players
    end

    it "should ask user for input again when input is invalid" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).at_least(2).times.with("How many players are playing? (1 or 2) ").and_return(0, 0, 1,)
      @game.stub(:assign_players)
      @game.create_players
    end
  end

  describe "#is_number_of_players_valid?" do
    it "should return true if number of players is 1" do
      @game.is_number_of_players_valid?(1).should eq true
    end

    it "should return true if number of players is 2" do
      @game.is_number_of_players_valid?(2).should eq true
    end

    it "should return false if number of players not 1 or 2" do
      @game.is_number_of_players_valid?(3).should eq false
    end
  end

  describe "#select_mark" do
    it "should return 'x'" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).once.with("Please enter 'x' or 'o'").and_return("x")
      @game.select_mark("Please enter 'x' or 'o'")
    end

    it "should return 'o'" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).once.with("Please enter 'x' or 'o'").and_return("o")
      @game.select_mark("Please enter 'x' or 'o'")
    end

    it "should ask user for input again if mark is invalid" do
      ui = double()
      @game.ui = ui
      ui.should_receive(:get_input).at_least(2).times.with("Please enter 'x' or 'o'").and_return("f", "x")
      @game.select_mark("Please enter 'x' or 'o'")
    end
  end

  describe "#is_mark_valid?" do
    it "should be true if mark is x" do
      @game.is_mark_valid?("X").should eq true
    end

    it "should be true if mark is o" do
      @game.is_mark_valid?("O").should eq true
    end

    it "should be false if not x or o" do
      @game.is_mark_valid?("f").should eq false
    end
  end

  describe "#get_player_move" do
    it "should return the move if the move is valid" do
      player = double()
      player.stub(:move) { 1 }
      @game.get_player_move(player).should eq 1
    end
  end

  describe "#is_move_valid? test true" do
    it "should return true" do
      @game.is_move_valid?(9).should eq true
    end
  end

  describe "#game_over test player x win" do
    it "should return 'x' as the winner" do
      Exit.stub(:exit)
      ui = double()
      @game.ui = ui
      ui.should_receive(:print_message).once.with("x wins!")
      @game.game_over("x")
    end
  end

  describe "#game_over test player o win" do
    it "should return 'o' as the winner" do
      Exit.stub(:exit)
      ui = double()
      @game.ui = ui
      ui.should_receive(:print_message).once.with("o wins!")
      @game.game_over("o")
    end
  end

  describe "#game_over test tie" do
    it "should return a tie game" do
      Exit.stub(:exit)
      @game.game_over("")
    end
  end

end

