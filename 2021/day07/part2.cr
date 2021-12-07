array = File.read("input").chomp.split(',').map(&.to_i)

min, max = array.minmax

res = (min..max).min_of do |p|
  array.map do |e|
    (0..(e - p).abs).sum
  end.sum
end

p res # => 102245489
