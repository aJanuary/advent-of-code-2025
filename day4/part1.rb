#!/usr/bin/env ruby

require_relative '../util/coordinate'
require_relative '../util/grid'

def count_neighbours(map, coord)
  NEIGHBOUR_DELTAS.count do |delta|
    neighbour_coord = coord + delta
    map.in_bounds?(neighbour_coord) && map[neighbour_coord] == '@'
  end
end

map = Grid.new(STDIN.readlines.map(&:chomp).map(&:chars))

num_accessible = map.each_with_coord.count do |c, coord|
  c == '@' && count_neighbours(map, coord) < 4
end

puts num_accessible