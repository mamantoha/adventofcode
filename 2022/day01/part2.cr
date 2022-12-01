result =
  File
    .read_lines("input.txt")
    .chunk(&.empty?)
    .reject(&.[0])
    .map(&.[1].map(&.to_i))
    .map(&.sum)
    .to_a
    .sort
    .last(3)
    .sum

puts result
# 207576
