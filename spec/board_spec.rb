require "spec_helper"
require "board"

describe Board do

  before :each do
    @board = Board.new(9)
  end

  describe "#new" do
    it "should return a new Board object" do
      @board.should be_an_instance_of Board
    end
  end

   describe "#initialize_spaces" do
     it "should be a Hash with a key statring at 1" do
       @board.initialize_spaces.keys[0].should eq 1
     end
   end

   describe "#initialize_spaces" do
     it "should be a Hash with a key ending at 9" do
       @board.initialize_spaces.keys[8].should eq 9
     end
   end

   describe "#initialize_spaces" do
     it "should have empty strings for all keys" do
       @board.initialize_spaces.values.should eq ["", "", "", "", "", "", "", "", ""]
     end
   end

   describe "#is_board_full?" do
     it "should return false" do
       @board.is_board_full?.should eq false
     end
   end

   describe "#is_board_full?" do
     it "should return true" do
      @board.spaces[1] = "X"
      @board.spaces[2] = "O"
      @board.spaces[3] = "x"
      @board.spaces[4] = "o"
      @board.spaces[5] = "x"
      @board.spaces[6] = "o"
      @board.spaces[7] = "x"
      @board.spaces[8] = "o"
      @board.spaces[9] = "x"
      @board.is_board_full?.should eq true
     end
   end

   describe "#is_a_tie?" do
     it "should return false" do
       @board.is_a_tie?.should eq false
     end
   end

   describe "#is_winner_declared?" do
     it "should return false" do
       @board.is_winner_declared?.should eq false
     end
   end

   describe "#rows_have_winner?" do
     it "should return true" do
       @board.spaces[1] = "X"
       @board.spaces[2] = "X"
       @board.spaces[3] = "X"
       @board.rows_have_a_winner?.should eq true
     end
   end

   describe "#rows_have_a_winner?" do
     it "should return false" do
       @board.rows_have_a_winner?.should eq false

     end
   end
end
