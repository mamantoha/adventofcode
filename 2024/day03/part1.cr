# input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
input = File.read("input.txt")

regex = /mul\((\d+),(\d+)\)/

result = input.scan(regex).sum { |m| m[1].to_i * m[2].to_i }

p! result

# 190604937
