#!/usr/bin/env ruby

d = STDIN.readlines.map(&:chomp).map(&:chars).transpose

results = []
operands = []
operator = nil
d.each do |l|
  if l.all? {|x| x == ' '}
    results << operands.inject(operator)
    operands = []
  else
    if l[-1] != ' '
      operator = l[-1].to_sym
    end

    operands << l[0..-2].join.to_i
  end
end
results << operands.inject(operator)

puts results.sum