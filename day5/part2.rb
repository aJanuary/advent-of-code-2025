#!/usr/bin/env ruby

fresh_str, stock_str = STDIN.read.split("\n\n")
fresh = fresh_str.split("\n").map {|l| Range.new(*l.split('-').map(&:to_i))}

merged_ranges = []
fresh.each do |range|
  overlapping, non_overlapping = merged_ranges.partition {|other| other.overlap?(range)}
  overlapping << range
  start = overlapping.map(&:min).min
  finish = overlapping.map(&:max).max
  merged_ranges = non_overlapping + [start..finish]
end

puts merged_ranges.map(&:size).sum