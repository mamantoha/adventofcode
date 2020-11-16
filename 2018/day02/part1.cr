lines = File.read_lines("input").map(&.chars)

checksums = {"2" => 0, "3" => 0}

lines.each do |chars|
  hash = Hash(Char, Int32).new(0)
  chars.each do |char|
    hash[char] += 1
  end
  checksums["2"] += 1 if hash.find { |k, v| v == 2 }
  checksums["3"] += 1 if hash.find { |k, v| v == 3 }
end

puts checksums["2"] * checksums["3"]
