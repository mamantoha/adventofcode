# input = File.read("input_example.txt")
input = File.read("input.txt")

result = 0

input.split(',').each do |str|
  b, e = str.split('-').map(&:to_i)
  (b..e).each do |id|
    str = id.to_s
    # puts str

    length = str.length
    first_half = str[0, length / 2]
    second_half = str[length / 2..-1]

    if first_half == second_half
      result += id
    end
  end
end

puts "---"
puts result
# 34826702005
