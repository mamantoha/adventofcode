module Comparable(T)
  # Check if a value between *min* and *max*.
  #
  # ```
  # 3.between?(1, 5)             # => true
  # 6.between?(1, 5)             # => false
  # "cat".between?("ant", "dog") # => true
  # "gnu".between?("ant", "dog") # => false
  # ```
  def between?(min, max)
    self >= min && self <= max
  end
end

valid_password_count = 0

File.read_lines("input").each do |line|
  policy, letter, password = line.split

  low, high = policy.split("-").map(&.to_i)
  letter = letter[0]
  count = password.count(letter)

  valid_password_count += 1 if count.between?(low, high)
end

puts valid_password_count # => 383
