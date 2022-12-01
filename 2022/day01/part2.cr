result =
  File
    .read("input.txt")
    .chomp
    .split("\n\n")
    .map(&.split('\n').map(&.to_i))
    .map(&.sum)
    .sort[-3..]
    .sum

puts result
# 207576
