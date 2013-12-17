require 'ui'

class Player

  attr_reader :mark
  attr_accessor :move

  def initialize(mark)
    @mark = mark
    @ui = UI.new
  end

  def move
    @ui.get_input("Choose your space")
  end

end
