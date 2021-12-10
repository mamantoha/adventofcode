lines = File.read_lines("input")

open_chars = ['(', '{', '<', '[']
close_chars = [')', '}', '>', ']']

points = {
  '(' => 1,
  '[' => 2,
  '{' => 3,
  '<' => 4,
}

scores = [] of Int64

lines.each do |line|
  corrupted = false

  memo = [] of Char

  line.chars.each do |char|
    if char.in?(open_chars)
      memo.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(memo.last) == close_chars.index(char)
        memo.pop
      else
        corrupted = true
        break
      end
    end
  end

  next if corrupted

  score = memo.reverse.reduce(0_i64) do |acc, char|
    acc *= 5
    acc += points[char]
  end

  scores << score
end

p scores.sort[scores.size // 2]
# => 1870887234
