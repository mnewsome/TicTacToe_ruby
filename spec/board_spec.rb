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

end
