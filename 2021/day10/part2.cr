lines = File.read_lines("input")

open_chars = ['(', '{', '<', '[']
close_chars = [')', '}', '>', ']']

points = {
  '(' => 1,
  '[' => 2,
  '{' => 3,
  '<' => 4,
}

incomplete_lines = lines.dup

lines.each do |line|
  memo = [] of Char

  line.chars.each_with_index do |char, i|
    if char.in?(open_chars)
      memo.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(memo.last) == close_chars.index(char)
        memo.pop
      else
        incomplete_lines.delete(line)

        break
      end
    end
  end
end

scores = incomplete_lines.map do |line|
  memo = [] of Char

  line.chars.each do |char|
    if char.in?(open_chars)
      memo.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(memo.last) == close_chars.index(char)
        memo.pop
      end
    end
  end

  memo.reverse.reduce(0_i64) do |acc, char|
    acc *= 5
    acc += points[char]

    acc
  end
end

p scores.sort[scores.size // 2]
# => 1870887234
