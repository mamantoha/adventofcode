lines = File.read_lines("input.txt")

stack = [] of String
folder_sizes = Hash(String, Int32).new(0)

lines.each do |line|
  case line
  when "$ cd .."
    stack.pop
  when /\$ cd (?<folder>.*)/
    stack.push([stack.last?, $~["folder"]].compact.join(' '))
  when /(?<size>\d+) (.*)/
    stack.each { |path| folder_sizes[path] += $~["size"].to_i }
  end
end

print "Part 1:"
puts folder_sizes.values.select { |v| v <= 100000 }.sum
# 1307902

print "Part 2:"
puts folder_sizes.values.select { |v| v >= folder_sizes["/"] - 40_000_000 }.min
# 7068748
