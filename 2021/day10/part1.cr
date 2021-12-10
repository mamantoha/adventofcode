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
  unclosed_chars = [] of Char

  line.chars.each do |char|
    if char.in?(open_chars)
      unclosed_chars.push(char)
    elsif char.in?(close_chars)
      if open_chars.index(unclosed_chars.last) == close_chars.index(char)
        unclosed_chars.pop
      else
        score += points[char]
        break
      end
    end
  end
end

p score
# => 315693
