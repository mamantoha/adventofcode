lines = File.read_lines("input")

open_chars = ['(', '{', '<', '[']
close_chars = [')', '}', '>', ']']

points = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

score = 0

lines.each do |line|
  memo = [] of Char

  line.chars.each do |char|
    if char.in?(open_chars)
      memo.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(memo.last) == close_chars.index(char)
        memo.pop
      else
        score += points[char]
        break
      end
    end
  end

  score
end

p score
# => 315693
