# input = File.read("input_example.txt")
input = File.read("input.txt")

grid = input.lines.reduce([] of Array(Int32)) do |acc, line|
  acc << line.chars.map(&.to_i)

  acc
end

visible_cont = 0

height = grid.size
width = grid.first.size

res = grid.each_with_index do |row, y|
  row.each_with_index do |v, x|
    # Check if visible
    visibilities = [
      # left
      (0...x).map { |x| grid[y][x] }.all? { |other| v > other },
      # top
      (0...y).map { |y| grid[y][x] }.all? { |other| v > other },
      # right
      (x + 1...width).map { |x| grid[y][x] }.all? { |other| v > other },
      # bottom
      (y + 1...height).map { |y| grid[y][x] }.all? { |other| v > other },
    ]

    visible_cont += 1 if visibilities.any?
  end
end

puts visible_cont

# 1794
