lines = File.read_lines("input")

horizontal_position = depth = aim = 0

lines.each do |line|
  if (match = /\A(?<command>forward|down|up) (?<units>\d+)\z/.match(line))
    units = match["units"].to_i

    case match["command"]
    when "down"
      aim += units
    when "up"
      aim -= units
    when "forward"
      horizontal_position += units
      depth += aim * units
    end
  end
end

puts horizontal_position * depth # => 1727785422
