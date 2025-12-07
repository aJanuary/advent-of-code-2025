#!/usr/bin/env ruby

require 'set'

edges = []
lines = STDIN.each_line.map do |l|
  Set.new(l.chars.each_with_index.filter_map do |c, x|
    if c == 'S'
      edges << x
      nil
    elsif c == '^'
      x
    end
  end)
end

num_splits = 0
lines.each do |line|
  next_edges = Set.new
  edges.each do |tip|
    if line.include?(tip)
      num_splits += 1
      next_edges << tip - 1
      next_edges << tip + 1
    else
      next_edges << tip
    end
  end
  edges = next_edges
end

puts num_splits