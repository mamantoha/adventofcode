require "dijkstra"

# FIXME it's slow!
# 37 seconds, and 4 seconds in releae mode

# TODO implement dijkstra with priority queue
#
# https://www.reddit.com/r/adventofcode/comments/rgqzt5/2021_day_15_solutions/
# https://shards.info/github/spider-gazelle/priority-queue/
# https://rosettacode.org/wiki/Dijkstra's_algorithm

# grid = File.read_lines("input_example").map(&.chars.map(&.to_i))
grid = File.read_lines("input").map(&.chars.map(&.to_i))

rows = grid.size - 1
cols = grid.first.size - 1

gr = Dijkstra::Graph(Tuple(Int32, Int32)).new(directed: true)

grid.each_with_index do |row, y|
  row.each_with_index do |col, x|
    gr.add_edge({y, x}, {y, x + 1}, grid[y][x + 1]) if x < cols
    gr.add_edge({y, x}, {y + 1, x}, grid[y + 1][x]) if y < rows
  end
end

puts gr.shortest_path({0, 0}, {rows, cols})

# => 429
