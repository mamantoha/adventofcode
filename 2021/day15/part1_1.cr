grid = File.read_lines("input_example").map(&.chars.map(&.to_i))
# grid = File.read_lines("input").map(&.chars.map(&.to_i))

rows = grid.size
cols = grid.first.size

risks = [Int32::MAX] of Int32

def step(grid, risks = [] of Int32, path = [] of Int32, y = 0, x = 0)
  # the starting position is never entered, so its risk is not counted
  unless x == y == 0
    path << grid[y][x]
  end

  # skip path if its risk is already higher the lowest total risk
  return if path.sum >= risks.min

  # is the bottom right position - end of the path
  if y == grid.size - 1 && x == grid.first.size - 1
    risks << path.sum
  end

  [
    {y, x + 1},
    {y + 1, x},
  ].each do |ny, nx|
    next unless ny < grid.size
    next unless nx < grid.first.size

    step(grid, risks, path.clone, ny, nx)
  end
end

step(grid, risks)

p risks.min
