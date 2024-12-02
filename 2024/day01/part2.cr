left_list, right_list = File
  .read_lines("input.txt")
  .map(&.split(/\s+/).map(&.to_i))
  .transpose

puts left_list.reduce(0) { |acc, x| acc + (x * right_list.count(x)) }

# 22776016
