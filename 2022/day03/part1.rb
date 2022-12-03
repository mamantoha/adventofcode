# frozen_string_literal: true

file_path = 'input.txt'

lines = File.readlines(file_path, chomp: true).map(&:chars)

range = 'a'..'z'

priorities = range.each_with_index.each_with_object({}) do |(c, i), memo|
  memo[c] = i + 1
  memo[c.upcase] = i + 27
end

sum = lines.sum do |line|
  chunks = line.each_slice(line.size / 2).to_a
  intersect = (chunks[0] & chunks[1]).first

  priorities[intersect]
end

puts sum

# 7793
