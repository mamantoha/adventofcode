numbers = File.read_lines("input").map(&.to_i)
# numbers = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

window_sums = numbers.each.with_index(1).reduce([] of Int32) do |acc, (_, i)|
  acc << numbers[i...i + 3].sum
end

result = window_sums.each.with_index.reduce(0) do |acc, (x, i)|
  acc +=1 if x > window_sums[i - 1]
  acc
end

puts result # => 1797
