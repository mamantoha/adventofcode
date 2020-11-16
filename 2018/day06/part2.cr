lines = File.read_lines("input")

class Point
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end

  def distance(point : Point)
    (@x - point.x).abs +  (@y - point.y).abs
  end
end

coordinates = lines.map { |line| line.split(", ").map(&.to_i)}
points = coordinates.map { |coord| Point.new(coord[0], coord[1])}

min_x, max_x = points.map(&.x).minmax
min_y, max_y = points.map(&.y).minmax

size = 0
max_distance = 10_000

min_x.upto(max_x) do |x|
  min_y.upto(max_y) do |y|
    point = Point.new(x, y)

    distances = points.map { |p| p.distance(point) }
    size +=1 if distances.sum < max_distance
  end
end

puts size
