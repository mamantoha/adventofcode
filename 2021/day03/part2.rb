lines = File.readlines("input").map(&:chomp)

lines = lines.map { |line| line.chars.map(&:to_i) }

most_lines = lines
least_lines = lines

bits_size = lines.first.size

bits_size.times do |i|
  most = most_lines.transpose[i].tally.max_by{ |k, v| [v, k] }[0]
  most_lines = most_lines.select { |line| line [i] == most }

  least = least_lines.transpose[i].tally.min_by{ |k, v| [v, k] }[0]
  least_lines = least_lines.select { |line| line [i] == least }
end

most = most_lines.join.to_i(2)
less = least_lines.join.to_i(2)

p most * less # => 3765399
