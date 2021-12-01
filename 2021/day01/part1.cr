numbers = File.read_lines("input").map(&.to_i)
# numbers = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

result = numbers.each.with_index.reduce(0) do |acc, (x, i)|
  acc +=1 if x > numbers[i - 1]
  acc
end

puts result # => 1766
