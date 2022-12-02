# frozen_string_literal: true

rounds = File
         .readlines('input.txt', chomp: true)
         .map { |l| l.split(' ') }

win =  %w[AY BZ CX] # 6
draw = %w[AX BY CZ] # 3
lose = %w[AZ BX CY] # 0

result = rounds.sum do |round|
  x1 =
    case round[1]
    when 'X'
      1
    when 'Y'
      2
    when 'Z'
      3
    end

  x2 =
    if win.include?(round.join)
      6
    elsif draw.include?(round.join)
      3
    elsif lose.include?(round.join)
      0
    end

  x1 + x2
end

puts result
# 11841
