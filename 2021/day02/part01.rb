lines = File.readlines("input")

horizontal_position = depth = 0

lines.each do |line|
  command, units = line.split
  units = units.to_i

  case [command, units]
  in ['forward', Integer]
    horizontal_position += units
  in ['up', Integer]
    depth -= units
  in ['down', Integer]
    depth += units
  end
end

puts horizontal_position * depth # => 1840243
