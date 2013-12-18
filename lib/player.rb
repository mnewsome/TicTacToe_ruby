require 'ui'

class Player

  attr_reader :mark
  attr_accessor :move

  def initialize(mark, name)
    @mark = mark
    @ui = UI.new
    @name = name
  end

  def move
    @ui.get_input("#{@name}, choose your space").to_i
  end

end
