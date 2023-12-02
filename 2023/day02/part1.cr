lines = File.read_lines("input.txt")

max_cubes = {
  "red"   => 12,
  "green" => 13,
  "blue"  => 14,
}

possible_games = [] of Int32

lines.each do |line|
  game, subsets = line.split(':', 2)
  game_id = game.split[1].to_i

  possible = true

  subsets = subsets.split(';')

  subsets.each do |subset|
    subset.split(',').map(&.strip).each do |set|
      if m = set.match(/(\d+) (red|green|blue)/)
        cubes = m[1].to_i
        color = m[2]

        possible = false if cubes > max_cubes[color]
      end
    end

    break unless possible
  end

  possible_games << game_id if possible
end

puts possible_games.sum
# => 2317
