# frozen_string_literal: true

file_path = 'input.txt'

lines = File.readlines(file_path, chomp: true).map(&:chars)

range = 'a'..'z'

priorities = range.each_with_object({}) do |c, memo|
  priority = c.ord - 96

  memo[c] = priority
  memo[c.upcase] = priority + 26
end

sum = lines.sum do |line|
  chunks = line.each_slice(line.size / 2).to_a
  intersect = (chunks[0] & chunks[1]).first

  priorities[intersect]
end

puts sum

# 7793
