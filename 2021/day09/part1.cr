heightmap = File.read_lines("input").map(&.chars.map(&.to_i))

rows = heightmap.size
cols = heightmap.first.size

low_points = [] of Int32

heightmap.each_with_index do |locations, y|
  locations.each_with_index do |number, x|
    adjacent_locations = [] of Int32

    ← = → = ↑ = ↓ = nil

    ← = heightmap.dig(y, x - 1) if x > 0
    → = heightmap.dig(y, x + 1) if x < cols - 1
    ↓ = heightmap.dig(y - 1, x) if y > 0
    ↑ = heightmap.dig(y + 1, x) if y < rows - 1

    adjacent_locations << ← if ←
    adjacent_locations << → if →
    adjacent_locations << ↓ if ↓
    adjacent_locations << ↑ if ↑

    low_points << number if adjacent_locations.all? { |n| number < n }
  end
end

p low_points.map { |n| n += 1 }.sum
# => 535
