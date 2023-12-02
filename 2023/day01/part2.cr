lines = File.read_lines("input.txt")

digit_words = %w{zero one two three four five six seven eight nine}

regex = /(?=(\d|#{digit_words[1..].join("|")}))/

result = lines.sum do |line|
  line.scan(regex).values_at(0, -1).map { |d| digit_words.index(d[1]) || d[1] }.join.to_i
end

puts result
# => 55358
