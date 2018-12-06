lines = File.read_lines("input")

struct Point
  property x, y

  def initialize(@x : Int32, @y : Int32)

  end

  def distance(point : Point)
    (@x - point.x).abs +  (@y - point.y).abs
  end
end

coordinates = lines.map { |line| line.split(", ").map(&.to_i)}
points = coordinates.map { |coord| Point.new(coord[0],coord[1])}

min_x = points.map(&.x).min
max_x = points.map(&.x).max
min_y = points.map(&.y).min
max_y = points.map(&.y).max

