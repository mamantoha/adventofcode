lines = File.read_lines("input")

regex = /position=<(?<x>(-|\s)?\d+), (?<y>(-|\s)?\d+)> velocity=<(?<move_x>(-|\s)?\d+), (?<move_y>(-|\s)?\d+)>/

class Point
  property x, y, second

  def initialize(@x : Int32, @y : Int32, @move_x : Int32, @move_y : Int32, second = 0)
    @second = 0
  end

  def next
    @second += 1
    @x += @move_x
    @y += @move_y
  end

  def match?(x : Int32, y : Int32)
    @x == x && @y == y
  end
end

points = [] of Point

lines.each do |line|
  if m = line.match(regex)
    points << Point.new(m["x"].to_i, m["y"].to_i, m["move_x"].to_i, m["move_y"].to_i)
  end
end

letter_size = 10
y_min, y_max, x_min, x_max = 0, 0, 0, 0

loop do
  y_min, y_max = points.map(&.y).minmax
  x_min, x_max = points.map(&.x).minmax
  break if y_max - y_min == letter_size - 1
  points.map(&.next)
end

puts "Part 1:"
(y_min..y_max).each do |y|
  (x_min..x_max).each do |x|
    point = points.find { |point| point.match?(x, y) }
    print point ? "#" : "."
  end
  puts
end

puts "Part 2:"
puts points.first.second
