#!/usr/bin/env ruby

ranges = STDIN.read.chomp.split(',').map do |range_str|
  from, to = range_str.split('-').map(&:to_i)
  from..to
end

invalid = ranges.flat_map do |range|
  range.filter do |i|
    i_str = i.to_s
    mid = i_str.length / 2
    i_str[0...mid] == i_str[mid..]
  end
end

puts invalid.sum