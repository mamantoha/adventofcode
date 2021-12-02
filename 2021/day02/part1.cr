lines = File.read_lines("input")

horizontal_position = depth = 0

lines.each do |line|
  if (match = /\A(?<command>forward|down|up) (?<units>\d+)\z/.match(line))
    units = match["units"].to_i

    case match["command"]
    when "forward"
      horizontal_position += units
    when "up"
      depth -= units
    when "down"
      depth += units
    end
  end
end

puts horizontal_position * depth # => 1840243
