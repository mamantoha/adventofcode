numbers = File.read_lines("input").map(&.to_i64)

pre = 25

if index = (pre...).find { |i| numbers[i - pre...i].combinations(2).none? { |c| c.sum == numbers[i] } }
  puts numbers[index] # => 27911108
end
