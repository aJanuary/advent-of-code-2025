#!/usr/bin/env ruby

ranges = STDIN.read.chomp.split(',').map do |range_str|
  Range.new(*range_str.split('-').map(&:to_i))
end

invalid = ranges.flat_map do |range|
  range.filter {|i| /^(\d+)\1+$/ =~ i.to_s}
end

puts invalid.sum