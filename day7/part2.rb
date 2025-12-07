#!/usr/bin/env ruby

require 'set'

edges = {}
lines = STDIN.each_line.map do |l|
  Set.new(l.chars.each_with_index.filter_map do |c, x|
    if c == 'S'
      edges[x] = 1
      nil
    elsif c == '^'
      x
    end
  end)
end

num_universes = 1
lines.each do |line|
  next_edges = Hash.new(0)
  edges.each do |tip, weight|
    if line.include?(tip)
      num_universes += weight
      next_edges[tip - 1] += weight
      next_edges[tip + 1] += weight
    else
      next_edges[tip] += weight
    end
  end
  edges = next_edges
end

puts num_universes