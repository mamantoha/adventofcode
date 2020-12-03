lines = File.read_lines("input")

SQUARE = '.'
TREE = '#'

# [right, down]
slopes = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

grid = [] of Array(Char)

lines.each do |line|
  grid << line.chars
end

rows = grid.size
cols = grid[0].size

trees_array = [] of Int64

slopes.each do |slope|
  right, down = slope

  trees = 0

  row = col = 0

  while row < rows
    trees += 1 if grid[row][col] == TREE

    row += down
    col += right
    col %= cols
  end

  trees_array << trees.to_i64
end

puts trees_array.product # => 2698900776
