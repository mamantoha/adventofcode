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
  corrupted_line = false

  unclosed_chars = [] of Char

  line.chars.each do |char|
    if char.in?(open_chars)
      unclosed_chars.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(unclosed_chars.last) == close_chars.index(char)
        unclosed_chars.pop
      else
        corrupted_line = true
        break
      end
    end
  end

  next if corrupted_line

  score = unclosed_chars.reverse.reduce(0_i64) do |acc, char|
    acc *= 5
    acc += points[char]
  end

  scores << score
end

p scores.sort[scores.size // 2]
# => 1870887234
