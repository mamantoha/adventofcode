lines = File.read_lines("input")

class Point
  property x, y, infinity, closest

  def initialize(@x : Int32, @y : Int32)
    @infinity = false
    @closest = [] of Point
  end

  def distance(point : Point)
    (@x - point.x).abs +  (@y - point.y).abs
  end

  def area_size
    @closest.size
  end

  def infinity?
    @infinity
  end
end

coordinates = lines.map { |line| line.split(", ").map(&.to_i)}
points = coordinates.map { |coord| Point.new(coord[0], coord[1])}

min_x, max_x = points.map(&.x).minmax
min_y, max_y = points.map(&.y).minmax

points.each do |point|
  if [min_x, max_x].includes?(point.x) || [min_y, max_y].includes?(point.y)
    point.infinity = true
  end
end

min_x.upto(max_x) do |x|
  min_y.upto(max_y) do |y|
    point = Point.new(x, y)

    distances = points.map { |p| p.distance(point) }.sort
    next if distances[0] == distances[1]

    closest_point = points.min_by { |p| p.distance(point)}
    closest_point.closest << point
  end
end

puts points.reject(&.infinity?).max_by { |point| point.area_size }.area_size
