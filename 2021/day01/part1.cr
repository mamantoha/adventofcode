numbers = File.read_lines("input").map(&.to_i)
# numbers = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

puts numbers.each_cons(2).count { |x| x[1] > x[0] } # => 1766
