class UI

  def initialize
  end

  def print_board(board_rows)
    (0...board_rows.size).each do |index1|
      (0...board_rows.size).each do |index2|
        print " #{board_rows[index1][index2]} | "
        if index2 == 2
          print "\n"
        end
      end
    end
  end

  def print_message(message)
    $stdout.puts message + "\n"
    message
  end

  def get_input(instruction)
      puts instruction
      STDIN.gets.chomp
  end
end
