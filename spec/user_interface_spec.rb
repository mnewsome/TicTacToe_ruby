require "rspec"
require "user_interface"
require "stringio"
require "tic_tac_toe_board"

describe UserInterface do

  before(:each) do
    @ui = UserInterface.new

    module Kernel

      def capture_stdout(&block)
        out = StringIO.new
        $stdout = out
        yield
        return out
      ensure
        $stdout = STDOUT
      end

      def capture_stdin(&block)
        input = StringIO.new
        $stdin = input
        yield
        return input
      ensure
        $stdin = STDIN
      end

    end

  end

  it "print the supplied message" do
    out = capture_stdout { @ui.print_message("Hola")  }
    out.string.should == "Hola\n"
  end

  it "print the board" do
    ttt_board = TicTacToeBoard.new(9)
    out = capture_stdout { @ui.print_board(ttt_board.rows) }
    out.string.should == "1 |\n2 |\n3 |\n4 |\n5 |\n6 |\n7 |\n8 |\n9 |\n"
  end

  it "print a promt and get input from the user" do
    out = capture_stdout { @ui.get_input("Type your name") }
    out.string.should == "Type your name\n"
  end

  it "get input from the user" do
    @ui.should_receive(:get_input).once.with("Test input")
    @ui.get_input("Test input")
  end

end
