# frozen_string_literal: true

rucksacks = File.readlines('input.txt', chomp: true)

priorities = ('a'..'z').each_with_index.each_with_object({}) do |(c, i), memo|
  memo[c] = i + 1
  memo[c.upcase] = i + 27
end

sum = rucksacks.sum do |rucksack|
  compartment = rucksack.chars.each_slice(rucksack.size / 2).to_a
  diff = (compartment[0] & compartment[1]).first

  priorities[diff]
end

puts sum

# 7793
