line = File.read("input")

regex = /(?<players>\d+) players; last marble is worth (?<points>\d+) points/

if m = line.match(regex)
  players = m["players"].to_i
  points = m["points"].to_i
end

def perform(players : Int32, points : Int32)
  scores = [0_u64] * players
  circle = Deque(Int32).new([0])

  (1..points).each do |point|
    if point % 23 == 0
      circle.rotate!(-7)
      scores[point % players] += circle.shift + point
    else
      circle.rotate!(2)
      circle.unshift(point)
    end
  end

  scores.max
end

if players && points
  puts "Part 1"
  puts perform(players, points)
  puts "Part 2"
  puts perform(players, points * 100)
end
