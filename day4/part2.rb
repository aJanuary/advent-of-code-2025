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

num_removed = 0

loop do
  num_removed_in_iter = 0
  map.each_with_index do |line, y|
    line.each_with_index do |c, x|
      next unless c == '@'
      if count_neighbours(map, x, y) < 4
        map[y][x] = '.'
        num_removed_in_iter += 1
        num_removed += 1
      end
    end
  end
  break if num_removed_in_iter == 0
end

puts num_removed