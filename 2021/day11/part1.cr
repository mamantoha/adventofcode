grid = File.read_lines("input").map(&.chars.map(&.to_i))

def check_flash(grid, y, x)
  value = grid[y][x]

  return if value.nil? # flashed
  return unless value > 9

  grid[y][x] = nil

  # neighborhoods
  [
    {y - 1, x},     # ↑
    {y - 1, x + 1}, # ↗
    {y, x + 1},     # →
    {y + 1, x + 1}, # ↘
    {y + 1, x},     # ↓
    {y + 1, x - 1}, # ↙
    {y, x - 1},     # ←
    {y - 1, x - 1}, # ↖
  ].each do |ny, nx|
    next unless 0 <= ny < grid.size
    next unless 0 <= nx < grid.first.size

    nvalue = grid[ny][nx]
    next unless nvalue

    grid[ny][nx] = nvalue + 1

    check_flash(grid, ny, nx)
  end
end

rows = grid.size
cols = grid.first.size

steps = 100
flashes = 0

# p "Before any steps:"
# pp grid

1.upto(steps) do |step|
  new_grid = grid.map do |row|
    row.map { |value| (value + 1).as(Int32?) }
  end

  rows.times do |y|
    cols.times do |x|
      check_flash(new_grid, y, x)
    end
  end

  # Turn flashed (nil) into 0
  new_grid = new_grid.map do |row|
    row.map { |value| value || 0 }
  end

  grid = new_grid

  # p "After step #{step}"
  # pp grid
  flashes += grid.sum { |row| row.count(0) }
end

p flashes
# => 1705
