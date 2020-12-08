lines = File.read_lines("input")

acc = 0
i = 0
visited = [] of Int32

loop do
  break if i.in?(visited)

  visited << i

  match = lines[i].match(/\A(\w{3}) ([+-]\d+)\z/).not_nil!

  op = match[1]
  arg = match[2].to_i

  case op
  when "acc"
    acc += arg
    i += 1
  when "jmp"
    i += arg
  when "nop"
    i += 1
  end
end

puts acc # => 1723
