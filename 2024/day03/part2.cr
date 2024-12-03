# input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

input = File.read("input.txt")

mul_regex = /mul\((\d+),(\d+)\)/
instructions_sep_regex = /(?=do(n't)?\(\))/

instructions = input.split(instructions_sep_regex)

result = instructions.sum do |instruction|
  if instruction.includes?("don't()")
    0
  else
    instruction.scan(mul_regex).sum { |m| m[1].to_i * m[2].to_i }
  end
end

p! result

# 82857512
