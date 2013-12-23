class Board
  attr_reader :spaces

  def initialize(size)
    @spaces = Array.new(size, "")
  end

  def size
    @spaces.size
  end

  def get_value_at(space)
    @spaces[space - 1]
  end

  def fill_space_at(space, value)
    @spaces[space - 1] = value
  end

  def get_all_values
    @spaces
  end
end
