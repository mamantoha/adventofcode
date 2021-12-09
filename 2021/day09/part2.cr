HEIGHTMAP = File.read_lines("input").map(&.chars.map(&.to_i))

ROWS = HEIGHTMAP.size
COLS = HEIGHTMAP.first.size

VISITED = [] of {Int32, Int32}

def basin(y : Int32, x : Int32, basin_locations = [] of {Int32, Int32}) : Array(Tuple(Int32, Int32))
  pos = {y, x}
  return basin_locations if pos.in?(VISITED) || pos.in?(basin_locations)

  return basin_locations if HEIGHTMAP[y][x] == 9

  basin_locations << pos

  # →
  basin(y, x + 1, basin_locations) if x < COLS - 1

  # ↓
  basin(y + 1, x, basin_locations) if y < ROWS - 1

  # ←
  basin(y, x - 1, basin_locations) if x > 0

  # ↑
  basin(y - 1, x, basin_locations) if y > 0

  basin_locations
end

basin_sizes = [] of Int32

ROWS.times do |y|
  COLS.times do |x|
    res = basin(y, x)

    next if res.empty?

    VISITED.concat(res)
    basin_sizes << res.size
  end
end

p basin_sizes.sort.last(3).reduce { |acc, i| acc * i }
# => 1122700
