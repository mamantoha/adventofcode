# lines = File.readlines("input_example.txt").map(&:chomp)
lines = File.readlines("input.txt").map(&:chomp)

result = lines.sum do |line|
  numbers = line.chars.map(&:to_i)

  m1 = numbers[...-1].max
  m1_index = numbers.index(m1)

  m2 = numbers[m1_index + 1..].max

  [m1, m2].join.to_i
end

puts result
