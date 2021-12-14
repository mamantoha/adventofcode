grid = File.read_lines("input").map(&.chars.map(&.to_i))

def check_flash(grid, y, x)
  value = grid[y][x]

  return if value.nil?
  return unless value > 9

  grid[y][x] = nil

  [
    {y - 1, x},
    {y - 1, x + 1},
    {y, x + 1},
    {y + 1, x + 1},
    {y + 1, x},
    {y + 1, x - 1},
    {y, x - 1},
    {y - 1, x - 1},
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

step = 1

loop do
  new_grid = grid.map do |row|
    row.map { |value| (value + 1).as(Int32?) }
  end

  rows.times do |y|
    cols.times do |x|
      check_flash(new_grid, y, x)
    end
  end

  new_grid = new_grid.map do |row|
    row.map { |value| value || 0 }
  end

  grid = new_grid

  break if grid.sum { |row| row.count(0) } == rows * cols

  step += 1
end

p step

# => 265
