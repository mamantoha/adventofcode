lines = File.readlines("input")

horizontal_position = depth = 0

lines.each do |line|
  if match = /(?<command>forward|down|up) (?<units>\d+)/.match(line)
    case match.named_captures.transform_keys(&:to_sym)
    in {command: 'forward', units: units}
      horizontal_position += units.to_i
    in {command: 'up', units: units}
      depth -= units.to_i
    in {command: 'down', units: units}
      depth += units.to_i
    end
  end
end

puts horizontal_position * depth # => 1840243
