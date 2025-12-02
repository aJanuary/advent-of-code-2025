#!/usr/bin/env ruby

def has_repeating_substring(str)
  (1..str.length / 2).filter {|i| str.length % i == 0}.any? do |period|
    pattern = str[0, period]

    (period...str.length).step(period).all? do |start|
      str[start, period] == pattern
    end
  end
end

ranges = STDIN.read.chomp.split(',').map do |range_str|
  Range.new(*range_str.split('-').map(&:to_i))
end

invalid = ranges.flat_map do |range|
  range.filter do |i|
    has_repeating_substring(i.to_s)
  end
end

puts invalid.sum