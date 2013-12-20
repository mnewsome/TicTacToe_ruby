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

     it "should be a Hash with a key ending at 9" do
       @board.initialize_spaces.keys[8].should eq 9
     end

     it "should have empty strings for all keys" do
       @board.initialize_spaces.values.should eq ["", "", "", "", "", "", "", "", ""]
     end
   end

   describe "#available_spaces" do
     it "should return the keys that have '' values" do
       @board.spaces[3] = "x"
       @board.spaces[6] = "x"
       @board.spaces[9] = "x"
       @board.available_spaces.should eq [1, 2, 4, 5, 7, 8]
     end
   end

  describe "#board_map" do
    it "should return nested arrays with the keys from initalize_spaces" do
        @board.board_map.should eq [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
  end

  describe "#rows" do
    it "should return nested arrays with the values of the spaces" do
      @board.rows.should eq [["", "", ""], ["", "", ""], ["", "", ""]]
    end
  end

  describe "#columns" do
    it "should retun next arays with the values of the spaces" do
      @board.spaces[2] = "x"
      @board.spaces[5] = "o"
      @board.spaces[8] = "x"
      @board.columns.should eq [["", "", ""], ["x", "o", "x"], ["", "", ""]]
    end
  end

  describe "#left_diagonal" do
    it "should ruturn an array with the values of the spaces" do
      @board.spaces[1] = "x"
      @board.spaces[5] = "x"
      @board.spaces[9] = "x"
      @board.left_diagonal.should eq ["x", "x", "x"]
    end
  end

  describe "#right_diagonal" do
      it "should return an array with the values of the spaces" do
        @board.spaces[3] = "x"
        @board.spaces[5] = "x"
        @board.spaces[7] = "x"
        @board.right_diagonal.should eq ["x", "x", "x"]
      end
  end
end

