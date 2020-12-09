numbers = File.read_lines("input").map(&.to_i64)

pre = 25

if index = (pre...).find { |i| numbers[i - pre...i].combinations(2).none? { |c| c.sum == numbers[i] } }
  invalid_number = numbers[index]

  minmax = {-1, -1}

  numbers.each_index.find do |index|
    sum = 0
    res = numbers[index..].take_while { |n| (sum += n) <= invalid_number }

    if res.sum == invalid_number
      minmax = res.minmax
      true
    else
      false
    end
  end

  puts minmax.sum # => 4023754
end
