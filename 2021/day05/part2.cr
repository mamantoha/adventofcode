lines = File.read_lines("input")

map = Hash(Tuple(Int32, Int32), Int32).new(0)

lines.each do |line|
  x1, y1, x2, y2 = line.split(" -> ").map(&.split(',').map(&.to_i)).flatten

  loop do
    map[{x1, y1}] += 1

    x1 += (x1 > x2) ? -1 : 1 if x1 != x2
    y1 += (y1 > y2) ? -1 : 1 if y1 != y2

    break if x1 == x2 && y1 == y2
  end

  map[{x2, y2}] += 1
end

p map.count { |_, v| v > 1 } # => 21101
