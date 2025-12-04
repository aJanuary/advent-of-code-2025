#!/usr/bin/env ruby

def count_neighbours(map, x, y)
  num_neighbours = [-1, 0, 1].map do |delta_y|
    new_y = y + delta_y
    if new_y < 0 || new_y >= map.size
      0
    else
      [-1, 0, 1].count do |delta_x|
        if delta_x == 0 && delta_y == 0
          false
        else
          new_x = x + delta_x
          if new_x < 0 || new_x >= map[0].size
            false
          else
            map[new_y][new_x] == '@'
          end
        end
      end
    end
  end.sum
end

map = STDIN.readlines.map(&:chomp).map(&:chars)

num_accessible = map.each_with_index.flat_map do |line, y|
  line.each_with_index.count do |c, x|
    next unless c == '@'
    count_neighbours(map, x, y) < 4
  end
end.sum

puts num_accessible