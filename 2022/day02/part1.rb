# rounds = File.readlines('input_example.txt', chomp: true).map { |l| l.split(' ') }
rounds = File.readlines('input.txt', chomp: true).map { |l| l.split(' ') }

win =  ['AY', 'BZ', 'CX'] # 6
draw = ['AX', 'BY', 'CZ'] # 3
lose = ['AZ', 'BX', 'CY'] # 0

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
    case
    when win.include?(round.join)
      6
    when draw.include?(round.join)
      3
    when lose.include?(round.join)
      0
    end

  x1 + x2
end

puts result
