puts File.read_lines("input").map(&.to_i).combinations(3).select { |a| a.sum == 2020 }.first.product
