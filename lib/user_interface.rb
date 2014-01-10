class UserInterface

  def self.print_message(message)
    puts message
  end

  def self.print_board(rows)
    (0...rows.size).each do |index1|
      (0...rows.size).each do |index2|
        print " #{ rows[index1][index2] } |"
        if index2 == rows[0].size - 1
          print "\n"
        end
      end
    end
  end

  def self.get_input(prompt)
    puts prompt
    STDIN.gets.chomp
  end

end
