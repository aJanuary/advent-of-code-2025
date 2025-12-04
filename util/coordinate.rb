Coordinate = Struct.new(:x, :y) do
  def +(other)
    Coordinate.new(x + other.x, y + other.y)
  end
end

NEIGHBOUR_DELTAS = [-1, 0, 1].product([-1, 0, 1])
  .reject {|delta| delta == [0, 0]}
  .map {|x, y| Coordinate.new(x, y)}
