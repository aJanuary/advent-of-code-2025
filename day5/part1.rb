#!/usr/bin/env ruby

fresh_str, stock_str = STDIN.read.split("\n\n")
fresh = fresh_str.split("\n").map {|l| Range.new(*l.split('-').map(&:to_i))}
stock = stock_str.split("\n").map(&:to_i)

puts fresh.inspect
puts stock.inspect

fresh_stock = stock.filter {|id| fresh.any? {|f| f.include?(id)}}
puts fresh_stock.count