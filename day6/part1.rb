#!/usr/bin/env ruby

problems = STDIN.readlines.map {|l| l.scan(/[\d+*]+/)}.transpose.map do |problem|
  {
    operands: problem[0..-2].map(&:to_i),
    operator: problem[-1] == '*' ? :* : :+,
  }
end

solutions = problems.map do |problem|
  problem[:operands].inject(problem[:operator])
end

puts solutions.sum