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
  end

  describe "#is_board_full?" do
    it "should return true" do
      @game_state.board.spaces[1] = "X"
      @game_state.board.spaces[2] = "O"
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[4] = "o"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[6] = "o"
      @game_state.board.spaces[7] = "x"
      @game_state.board.spaces[8] = "o"
      @game_state.board.spaces[9] = "x"
      @game_state.is_board_full?.should eq true
    end
  end

  describe "#is_a_tie?" do
    it "should return false" do
      @game_state.is_a_tie?.should eq false
    end
  end

  describe "#is_x_winner? rows" do
    it "should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[2] = "x"
      @game_state.board.spaces[3] = "x"
      @game_state.is_x_winner?.should eq true
    end
  end

  describe "#is_x_winner? columns" do
    it "should return true" do
      @game_state.board.spaces[2] = "x"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[8] = "x"
      @game_state.is_x_winner?.should eq true
    end
  end

  describe "#is_x_winner? left_diagonal" do
    it "should return true" do
      @game_state.board.spaces[1] = "x"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[9] = "x"
      @game_state.is_x_winner?.should eq true
    end
  end

  describe "#is_x_winner? right_diagonal" do
    it "should return true" do
      @game_state.board.spaces[3] = "x"
      @game_state.board.spaces[5] = "x"
      @game_state.board.spaces[7] = "x"
      @game_state.is_x_winner?.should eq true
    end
  end


  describe "#is_x_winner? test false" do
    it "should return false" do
      @game_state.is_x_winner?.should eq false
      end
  end
end
