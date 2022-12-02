# frozen_string_literal: true

rounds = File
         .readlines('input.txt', chomp: true)
         .map { |l| l.split(' ') }

LOST = 0
DRAW = 3
WIN = 6

ROCK = 1
PAPER = 2
SCISSORS = 3

points = {
  'X' => ROCK,
  'Y' => PAPER,
  'Z' => SCISSORS
}

win =  %w[AY BZ CX]
draw = %w[AX BY CZ]
lose = %w[AZ BX CY]

result = rounds.sum do |round|
  case round[1]
  when 'X'
    points[lose.detect { |c| c.start_with?(round[0]) }.chars.last] + LOST
  when 'Y'
    points[draw.detect { |c| c.start_with?(round[0]) }.chars.last] + DRAW
  when 'Z'
    points[win.detect { |c| c.start_with?(round[0]) }.chars.last] + WIN
  end
end

puts result

# 13022
