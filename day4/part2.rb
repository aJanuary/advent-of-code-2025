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

total_removed = 0
loop do
  removed_this_round = 0
  map.each_with_coord do |c, coord|
    next unless c == '@'
    if count_neighbours(map, coord) < 4
      map[coord] = '.'
      removed_this_round += 1
    end
  end
  break if removed_this_round == 0
  total_removed += removed_this_round
end

puts total_removed