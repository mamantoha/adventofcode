puts File
  .read_lines("input.txt")
  .map(&.split(/\s+/)
    .map(&.to_i))
  .transpose
  .map(&.sort)
  .transpose
  .map { |x| (x[0] - x[1]).abs }
  .sum

# 1660292
