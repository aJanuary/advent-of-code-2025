#!/usr/bin/env ruby

ranges = STDIN.read.chomp.split(',').map do |range_str|
  from, to = range_str.split('-').map(&:to_i)
  from..to
end

invalid = ranges.flat_map do |range|
  range.filter do |i|
    i_chars = i.to_s.chars
    (1...i_chars.length).any? do |reps|
      i_chars.each_slice(reps).uniq.length == 1
    end
  end
end

puts invalid.sum