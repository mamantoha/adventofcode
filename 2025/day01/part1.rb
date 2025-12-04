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

  if point < 0
    point = 100 + point
  elsif point > 99
    point = point - 100
  end

  point = point % 100

  password += 1 if point.zero?

  puts point
end

puts "---"
puts password
