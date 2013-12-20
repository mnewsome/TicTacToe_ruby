require "spec_helper"
require "game_state"
require "board"

describe GameState do
  before(:each) do
    @game_state = GameState.new(Board.new(9))
  end

  describe "#is_board_full?" do
    it "should return false" do
      @game_state.is_board_full?.should eq false
    end

    it "should return true" do
      @game_state.board.spaces[1] = "X"
      @game_state.board.spaces[2] = "O"
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[4] = "o"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[6] = "o"
      @game_state.board.spaces[7] = "o"
      @game_state.board.spaces[8] = "o"
      @game_state.board.spaces[9] = "x"
      @game_state.is_board_full?.should eq true
    end
  end

  describe "#is_a_tie?" do
    it "should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[2] = "o"
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[4] = "o"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[6] = "o"
      @game_state.board.spaces[7] = "o"
      @game_state.board.spaces[8] = "x"
      @game_state.board.spaces[9] = "o"
      @game_state.is_a_tie?.should eq true
    end

    it "should return false" do
      @game_state.is_a_tie?.should eq false
    end
  end

  describe "#is_winner_declared?" do
    it "should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[2] = "x"
      @game_state.board.spaces[3] = "x"
      @game_state.is_winner_declared?.should eq true
    end

    it "should return false" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[5] = ""
      @game_state.board.spaces[9] = "x"
      @game_state.is_winner_declared?.should eq false
    end
  end

  describe "#is_winner?" do
    it "rows should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[2] = "x"
      @game_state.board.spaces[3] = "x"
      @game_state.is_winner?("x").should eq true
    end

    it "columns should return true" do
      @game_state.board.spaces[2] = "o"
      @game_state.board.spaces[5] = "o"
      @game_state.board.spaces[8] = "o"
      @game_state.is_winner?("o").should eq true
    end

    it "left_diagonal should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[9] = "x"
      @game_state.is_winner?("x").should eq true
    end

    it "right diagonal should return true" do
      @game_state.board.spaces[3] = "o"
      @game_state.board.spaces[5] = "o"
      @game_state.board.spaces[7] = "o"
      @game_state.is_winner?("o").should eq true
    end

    it "should return false" do
      @game_state.is_winner?("o").should eq false
    end

    it "rows should return false" do
      @game_state.board.spaces[7] = "x"
      @game_state.board.spaces[8] = "o"
      @game_state.board.spaces[9] = "o"
      @game_state.is_winner?("o").should eq false
    end

    it "columns should return false" do
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[6] = "x"
      @game_state.board.spaces[9] = ""
      @game_state.is_winner?("x").should eq false
    end

    it "left_diagonal should return false" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[9] = ""
      @game_state.is_winner?("x").should eq false
    end

    it "right_diagonal should return false" do
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[5] = ""
      @game_state.board.spaces[7] = "x"
      @game_state.is_winner?("x").should eq false
    end

  end

end
