class Board
  attr_reader :spaces

  def initialize(size)
    @spaces = (1..size).to_a
  end

  def size
    @spaces.size
  end

  def get_value_at(space)
    @spaces[space.to_i - 1]
  end

  def fill_space_at(space, value)
    @spaces[space - 1] = value
  end

end
