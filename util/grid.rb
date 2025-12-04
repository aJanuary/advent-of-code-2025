class Grid
  def initialize(arr)
    @arr = arr
    @width = arr[0].size
    @height = arr.size
  end

  def [](coord)
    @arr[coord.y][coord.x]
  end

  def []=(coord, value)
    @arr[coord.y][coord.x] = value
  end

  def each_with_coord
    return enum_for(:each_with_coord) unless block_given?

    (0...@width).each do |x|
      (0...@height).each do |y|
        yield [@arr[y][x], Coordinate.new(x, y)]
      end
    end
  end

  def in_bounds?(coord)
    coord.x >= 0 && coord.x < @width && coord.y >= 0 && coord.y < @height
  end
end