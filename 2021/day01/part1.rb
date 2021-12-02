numbers = File.readlines("input").map(&:to_i)

puts numbers.each_cons(2).count { _1 < _2 } # => 1766
