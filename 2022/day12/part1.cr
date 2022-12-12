require "dijkstra"

# grid = File.read_lines("input_example.txt").map(&.chars)
grid = File.read_lines("input.txt").map(&.chars)

start = {0, 0}
finish = {0, 0}

visited = [] of Tuple(Int32, Int32)

gr = Dijkstra::Graph(Tuple(Int32, Int32)).new(directed: true)

# Set start/finish
grid.each_with_index do |row, y|
  row.each_with_index do |col, x|
    if grid[y][x] == 'S'
      start = {y, x}

      grid[y][x] = 'a'
    end

    if grid[y][x] == 'E'
      finish = {y, x}

      grid[y][x] = 'z'
    end
  end
end

grid.each_with_index do |row, y|
  row.each_with_index do |col, x|
    current_val = grid[y][x]

    # neighborhoods
    [
      {y - 1, x}, # ↑
      {y, x + 1}, # →
      {y + 1, x}, # ↓
      {y, x - 1}, # ←
    ].each do |dy, dx|
      next unless 0 <= dy < grid.size
      next unless 0 <= dx < grid.first.size

      next_val = grid[dy][dx]

      if current_val == next_val || current_val.ord == next_val.ord - 1 || current_val.ord > next_val.ord
        gr.add_edge({y, x}, {dy, dx}, 1)
      end
    end
  end
end

p! start
p! finish

if (result = gr.shortest_path(start, finish))
  p! result.first
end

# 484
