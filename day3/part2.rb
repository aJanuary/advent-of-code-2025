#!/usr/bin/env ruby

NUM_BATTERIES = 12

banks = STDIN.readlines.map {|l| l.chomp.chars.map(&:to_i)}
max_joltages = banks.map do |bank|
  jolts = 0
  start_index = 0
  NUM_BATTERIES.times do |i|
    battery, index = bank[0..-(NUM_BATTERIES-i)].each_with_index.drop(start_index).max_by {|battery, _index| battery}
    jolts = (jolts * 10) + battery
    start_index = index + 1
  end
  jolts
end
puts max_joltages.sum