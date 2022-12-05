require "./range"
require "./string"

file_path = "input.txt"

lines =
  File
    .read_lines(file_path)
    .map(&.split_once(',').map(&.split_once('-').map(&.to_i)).map { |(b, e)| b..e })

puts "Part 1:"
puts lines.count { |p| p[0].covers?(p[1]) || p[1].covers?(p[0]) }
# 456

puts "Part 2:"
puts lines.count { |p| p[0].overlaps?(p[1]) }
# 808
