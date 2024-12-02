puts File
  .read_lines("input.txt")
  .map(&.split(/\s+/).map(&.to_i))
  .transpose
  .map(&.sort)
  .transpose
  .sum { |x| (x[0] - x[1]).abs }

# 1660292
