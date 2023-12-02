lines = File.read_lines("input.txt")
numbers = lines.map { |line| line.chars.select(&.number?) }
result = numbers.sum { |number| "#{number[0]}#{number[-1]}".to_i }

puts result
# => 56042
