#!/usr/bin/env ruby

directions = STDIN.each_line.map do |str|
  direction_delta = str[0] == 'L' ? -1 : 1
  clicks = str[1..].to_i
  clicks * direction_delta
end

dial = 50
num_zeros = 0
directions.each do |d|
  num_zeros += d.abs / 100
  new_dial = dial + (d.abs % 100) * (d <=> 0)
  num_zeros += 1 if dial != 0 && (new_dial <= 0 || new_dial >= 100)
  dial = new_dial % 100
end
puts num_zeros