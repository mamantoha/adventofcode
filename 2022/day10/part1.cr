# lines =  File.read_lines("small_input.txt").each
# lines =  File.read_lines("input_example.txt").each
lines = File.read_lines("input.txt").each

registers = [] of Int32

memo = 1

loop do
  line = lines.next

  break if line.is_a?(Iterator::Stop)

  case line
  when "noop"
    registers << memo
  when /addx (-?\d+)/
    2.times { registers << memo }

    memo += $1.to_i
  end
end

sum = 0
[20, 60, 100, 140, 180, 220].each { |cycle| sum += registers[cycle - 1] * cycle }

puts sum

# 16020
