lines = File.read_lines("input.txt")

result = 0

lines.each do |line|
  subsets = line.split(':', 2).last

  fewer_cubes = {
    "red"   => 1,
    "green" => 1,
    "blue"  => 1,
  }

  subsets = subsets.split(';')

  subsets.each do |subset|
    subset.split(',').map(&.strip).each do |set|
      if m = set.match(/(\d+) (red|green|blue)/)
        cubes = m[1].to_i
        color = m[2]

        fewer_cubes[color] = cubes if cubes > fewer_cubes[color]
      end
    end
  end

  result += fewer_cubes.values.product
end

puts result
# => 74804
