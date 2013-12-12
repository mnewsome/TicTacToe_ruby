require "spec_helper"
require "ui"
require "board"

describe UI do

  before :each do
    @ui = UI.new
    @board = Board.new(9)
  end

  describe "#new" do
    it "should create a new UI object" do
      @ui.should be_an_instance_of UI
    end
  end

  describe "#print_board" do
    it "should print the board to terminal" do
      @ui.print_board(@board.number_of_spaces)
    end
  end

  describe "#print_message" do
    it "should take a string as an argument and
      print it to the terminal" do
      message = @ui.print_message("Hello, TicTacToe!")
      message.should eq "Hello, TicTacToe!"
    end
  end

  describe "#get_input" do
    it "should get input from a user and return that value" do
    input_from_user = @ui.get_input()
    input.should eq 4
    end
  end

end
