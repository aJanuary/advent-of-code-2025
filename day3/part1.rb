#!/usr/bin/env ruby

banks = STDIN.readlines.map {|l| l.chomp.chars.map(&:to_i)}
max_joltages = banks.map do |bank|
  first_battery, index = bank[0..-2].each_with_index.max_by {|battery, _index| battery}
  second_battery = bank[index + 1..].max
  (first_battery * 10) + second_battery
end
puts max_joltages.sum