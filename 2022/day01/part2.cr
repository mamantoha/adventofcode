result =
  File
    .read("input.txt")
    .chomp
    .split("\n\n")
    .map(&.lines.map(&.to_i).sum)
    .sort[-3..]
    .sum

puts result
# 207576
