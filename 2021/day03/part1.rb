lines = File.readlines("input").map(&:chomp)

gamma_rate = []
epsilon_rate = []

lines.reduce([]) { |acc, line| acc << line.chars.map(&:to_i) }.transpose.each do |e|
  rates = e.tally.sort_by { |_, v| v }

  gamma_rate << rates[1][0]
  epsilon_rate << rates[0][0]
end

decimal_gamma_rate = gamma_rate.join.to_i(2)
decimal_epsilon_rate = epsilon_rate.join.to_i(2)

puts decimal_epsilon_rate * decimal_gamma_rate # => 3549854
