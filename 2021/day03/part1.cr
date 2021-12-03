lines = File.read_lines("input")

gamma_rate = [] of Int32
epsilon_rate = [] of Int32

lines.reduce([] of Array(Int32)) { |acc, line| acc << line.chars.map(&.to_i) }.transpose.each do |e|
  rates = e.tally.to_a.sort_by { |_, v| v }

  gamma_rate << rates[1][0]
  epsilon_rate << rates[0][0]
end

decimal_gamma_rate = gamma_rate.join.to_i(2)
decimal_epsilon_rate = epsilon_rate.join.to_i(2)

puts decimal_epsilon_rate * decimal_gamma_rate # => 3549854
