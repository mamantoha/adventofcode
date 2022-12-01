result =
  File
    .read('input.txt')
    .split("\n\n")
    .map { _1.lines.map(&:to_i).sum }
    .max(3)
    .sum

puts result
# 207576
