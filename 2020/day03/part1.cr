lines = File.read_lines("input")

SQUARE = '.'
TREE = '#'

grid = [] of Array(Char)

lines.each do |line|
  grid << line.chars
end

trees = 0
col = 0
rows = grid.size
cols = grid[0].size

rows.times do |row|
  trees += 1 if grid[row][col % cols] == TREE
  col += 3
end

puts trees # => 262
