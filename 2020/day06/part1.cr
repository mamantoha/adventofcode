lines = File.read("input").split("\n\n").map(&.gsub("\n", ""))

sum = 0
lines.map { |l| l.chars.uniq.join }.each { |answer| sum += answer.size }

puts sum # => 6590
