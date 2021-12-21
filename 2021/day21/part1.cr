lines = File.read_lines("input")

player1_pos = lines[0].chars.last.to_i
player2_pos = lines[1].chars.last.to_i

player1_total_score = 0
player2_total_score = 0

times = 3

p (1..100).cycle.each_slice(times).map(&.sum).with_index do |sum, i|
  if i.even?
    player1_pos = ((player1_pos + sum - 1) % 10) + 1
    player1_total_score += player1_pos

    break player2_total_score * times * (i + 1) if player1_total_score >= 1000
  else
    player2_pos = ((player2_pos + sum - 1) % 10) + 1
    player2_total_score += player2_pos

    break player1_total_score * times * (i + 1) if player2_total_score >= 1000
  end
end

# => 757770
