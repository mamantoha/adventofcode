numbers = File.readlines("input").map(&:to_i)

# Part 1
puts numbers.each_cons(2).count { _1 < _2 } # => 1766

# Part 2
puts numbers.each_cons(4).count { _1 < _4 } # => 1797
