require "levenshtein"

lines = File.read_lines("input")

combinations = lines.combinations(2)

common = [] of Char

combinations.each do |combination|
  if Levenshtein.distance(combination[0], combination[1]) == 1
    combination[0].chars.zip(combination[1].chars).each do |set|
      if set[0] == set[1]
        common << set[0]
      end
    end
  end
end

puts common.join
