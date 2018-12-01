puts File.read_lines("input").map(&.to_i).reduce(0) { |acc, i| acc += i }
