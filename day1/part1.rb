#!/usr/bin/env ruby

directions = STDIN.each_line.map do |str|
  direction_delta = str[0] == 'L' ? -1 : 1
  clicks = str[1..].to_i
  clicks * direction_delta
end

positions = directions.each_with_object([50]) do |dir, history|
  history << (history[-1] + dir) % 100
end

puts positions.count(0)
