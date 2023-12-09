require "dijkstra"

map = File.read_lines("input").map(&.chars.map(&.to_i))
# map = File.read_lines("input_example").map(&.chars.map(&.to_i)) # => 315

width = map.first.size
height = map.size

grid = Array.new(height * 5) do |y|
  Array.new(width * 5) do |x|
    outer_x, inner_x = x.divmod(width)
    outer_y, inner_y = y.divmod(width)
    increment = outer_x + outer_y
    new_value = map[inner_y][inner_x] + increment
    new_value = new_value - 9 if new_value > 9
    new_value
  end
end

rows = grid.size - 1
cols = grid.first.size - 1

gr = Dijkstra::Graph(Tuple(Int32, Int32)).new(directed: true)

grid.each_with_index do |row, y|
  row.each_with_index do |col, x|
    gr.add_edge({y, x}, {y, x + 1}, grid[y][x + 1]) if x < cols
    gr.add_edge({y, x}, {y + 1, x}, grid[y + 1][x]) if y < rows
  end
end

if (result = gr.shortest_path({0, 0}, {rows, cols}))
  puts result.first
end

# Current implementation returns 2851
# but correct is 2844
