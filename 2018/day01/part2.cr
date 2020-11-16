lines = File.read_lines("input").map(&.to_i)

frequency = 0
frequencies = Set{frequency}

lines.cycle.each do |i|
  frequency += i
  break if frequencies.includes?(frequency)
  frequencies << frequency
end

puts frequency
