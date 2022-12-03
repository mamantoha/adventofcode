# frozen_string_literal: true

rucksacks = File.readlines('input.txt', chomp: true)

priorities = ('a'..'z').each_with_index.each_with_object({}) do |(c, i), memo|
  memo[c] = i + 1
  memo[c.upcase] = i + 27
end

sum = rucksacks.each_slice(3).sum do |g|
  diff = (g[0].chars & g[1].chars & g[2].chars).first

  priorities[diff]
end

puts sum

# 2499
