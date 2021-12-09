heightmap = File.read_lines("input").map(&.chars.map(&.to_i))

rows = heightmap.size
cols = heightmap.first.size

low_points = [] of Int32

heightmap.each_with_index do |locations, y|
  locations.each_with_index do |number, x|
    adjacent_locations = [] of Int32

    left = right = up = down = nil

    left = heightmap.dig(y, x - 1) if x > 0
    right = heightmap.dig(y, x + 1) if x < cols - 1
    down = heightmap.dig(y - 1, x) if y > 0
    up = heightmap.dig(y + 1, x) if y < rows - 1

    adjacent_locations << left if left
    adjacent_locations << right if right
    adjacent_locations << down if down
    adjacent_locations << up if up

    low_points << number if adjacent_locations.all? { |n| number < n }
  end
end

p low_points.map { |n| n += 1 }.sum
# => 535
