point = 50
password = 0

# lines = File.readlines("input_example.txt")
lines = File.readlines("input.txt")

lines.each do |line|
  match = line.match(/^(L|R)(\d+)$/)
  direction = match[1]
  distance = match[2].to_i

  case direction
  when 'L'
    point -= distance
  when 'R'
    point += distance
  end

  if point > 99 || point <= 0
    if point.zero?
      # funny because this was a typo
      # I meant `password += 1`
      # But it returns correct result
      point += 1
    else
      password += (point / 100).abs
    end
  end

  if point < 0
    point += 100
  elsif point > 99
    point -= 100
  end

  point = point % 100

  # puts point
end

puts "---"
puts password

# 6122
