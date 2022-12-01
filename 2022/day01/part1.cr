result =
  File
    .read_lines("input.txt")
    .chunk(&.empty?)
    .reject(&.[0])
    .map(&.[1].map(&.to_i))
    .map(&.sum)
    .max

puts result
# 69883
