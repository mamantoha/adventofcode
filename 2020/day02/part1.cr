valid_password_count = 0

File.read_lines("input").each do |line|
  policy, letter, password = line.split

  low, high = policy.split("-").map(&.to_i)
  letter = letter[0]
  count = password.count(letter)

  valid_password_count +=1 if count >= low && count <= high
end

puts valid_password_count
