lines = File.read_lines("input")
claims = [] of Claim

struct Point
  def initialize(@x : Int32, @y : Int32)
  end
end

struct Claim
  def initialize(@id : Int32, @margin_left : Int32, @margin_top : Int32, @width : Int32, @height : Int32)
  end

  def fill : Array(Point)
    points = [] of Point

    @width.times.each do |x|
      @height.times.each do |y|
        points << Point.new(x + @margin_left, y + @margin_top)
      end
    end

    points
  end
end

module Utils
  extend self

  # Parses line "#123 @ 3,2: 5x4" into Claim
  def parse_line(line : String) : Claim?
    regex = /#(?<id>\d+) @ (?<left>\d+),(?<top>\d+): (?<width>\d+)x(?<height>\d+)/
    m = line.match(regex)

    if m
      return Claim.new(m["id"].to_i, m["left"].to_i, m["top"].to_i, m["width"].to_i, m["height"].to_i)
    end
  end
end

lines.each do |line|
  claim = Utils.parse_line(line)
  claims << claim if claim
end

areas = Hash(Point, Int32).new(0)

claims.each do |claim|
  points = claim.fill
  points.each do |point|
    areas[point] += 1
  end
end

puts areas.select { |point, count| count > 1 }.size
