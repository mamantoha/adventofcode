lines = File.read_lines("input")

lines = lines.map(&.chars.map(&.to_i))

most_lines = lines
least_lines = lines

bits_size = lines.first.size

bits_size.times do |i|
  # stop is only one number left
  if most_lines.size > 1
    most = most_lines.transpose[i].tally.max_by { |k, v| [v, k] }[0]
    most_lines = most_lines.select { |line| line[i] == most }
  end

  if least_lines.size > 1
    least = least_lines.transpose[i].tally.min_by { |k, v| [v, k] }[0]
    least_lines = least_lines.select { |line| line[i] == least }
  end
end

most = most_lines.first.join.to_i(2)
least = least_lines.first.join.to_i(2)

p most * least # => 3765399
