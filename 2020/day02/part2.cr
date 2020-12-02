valid_password_count = 0

File.read_lines("input").each do |line|
  policy, letter, password = line.split

  pos1, pos2 = policy.split("-").map(&.to_i)
  letter = letter[0]

  valid_password_count +=1 if (password[pos1 -1] == letter) != (password[pos2 - 1] == letter)
end

puts valid_password_count # => 272
