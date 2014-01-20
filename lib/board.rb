class Board
  attr_reader :spaces

  def initialize(size)
    @spaces = (1..size).to_a
  end

  def size
    @spaces.size
  end

  def depth
    Math.sqrt(size)
  end

  def get_value_at(space)
    @spaces[space.to_i - 1]
  end

  def fill_space_at(space, value)
    if is_space_available_at?(space)
      @spaces[space.to_i - 1] = value
    else
      raise ArgumentError.new( "Space #{space} not available"     )
    end
  end

  def reset_space_at(space)
    @spaces[space.to_i - 1] = space
  end

  def is_space_available_at?(space)
    get_value_at(space) == space.to_i
  end

  def available_spaces
    space_list = []
    @spaces.each do |space|
      space_list << space if space.is_a? Fixnum
    end
    space_list
  end
end
