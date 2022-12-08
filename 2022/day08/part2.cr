module Enumerable(T)
  def take_while(include_falsey = false, & : T ->) : Array(T)
    result = Array(T).new

    each do |x|
      unless yield x
        result << x if include_falsey

        break
      end

      result << x
    end
    result
  end
end

# input = File.read("input_example.txt")
input = File.read("input.txt")

grid = input.lines.reduce([] of Array(Int32)) do |acc, line|
  acc << line.chars.map(&.to_i)

  acc
end

scores = [] of Int32

height = grid.size
width = grid.first.size

res = grid.each_with_index do |row, y|
  row.each_with_index do |v, x|
    directions = [
      # ←
      (x - 1).downto(0).map { |dx| grid[y][dx] }.to_a,
      # →
      (x + 1).upto(width - 1).map { |dx| grid[y][dx] }.to_a,
      # ↑
      (y - 1).downto(0).map { |dy| grid[dy][x] }.to_a,
      # ↓
      (y + 1).upto(height - 1).map { |dy| grid[dy][x] }.to_a,
    ]

    score = directions.map { |dir| dir.take_while(true) { |e| v > e } }.map(&.size).product
    scores << score
  end
end

puts scores.max
# 199272
