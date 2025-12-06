#!/usr/bin/env ruby

problems = STDIN.readlines.map(&:chomp).map(&:chars).transpose.reverse

results = []
operands = []
problems.each do |l|
  if l.all? {|x| x == ' '}
    operands = []
  else
    operands << l[0..-2].join.to_i

    if l[-1] != ' '
      operator = l[-1].to_sym
      results << operands.inject(operator)
    end
  end
end

puts results.sum