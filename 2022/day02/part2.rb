# rounds = File.readlines('input_example.txt', chomp: true).map { |l| l.split(' ') }
rounds = File.readlines('input.txt', chomp: true).map { |l| l.split(' ') }

points = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3,
}

win =  ['AY', 'BZ', 'CX'] # 6
draw = ['AX', 'BY', 'CZ'] # 3
lose = ['AZ', 'BX', 'CY'] # 0

result = rounds.sum do |round|
  case round[1]
  when 'X' # lose
    points[lose.detect { |c| c.start_with?(round[0]) }.chars.last] + 0
  when 'Y' # draw
    points[draw.detect { |c| c.start_with?(round[0]) }.chars.last] + 3
  when 'Z' # win
    points[win.detect { |c| c.start_with?(round[0]) }.chars.last] + 6
  end
end

puts result
