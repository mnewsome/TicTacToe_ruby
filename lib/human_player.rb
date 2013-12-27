class HumanPlayer

  attr_reader :name, :mark, :ui

  def initialize(name, mark, ui)
    @name = name
    @mark = mark
    @ui = ui
  end

  def move(prompt)
    @ui.get_input(prompt)
  end

end
