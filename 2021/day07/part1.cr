array = File.read("input").chomp.split(',').map(&.to_i)

res = array.min_of do |p|
  array.map { |e| (e - p).abs }.sum
end

p res # => 355989
