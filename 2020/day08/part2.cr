lines = File.read_lines("input")

changed = [] of Int32

loop do
  acc = 0
  i = 0
  visited = [] of Int32
  is_changed = false

  begin
    loop do
      break if i.in?(visited)

      visited << i

      match = lines[i].match(/\A(\w{3}) ([+-]\d+)\z/).not_nil!

      op = match[1]
      arg = match[2].to_i

      if op.in?(["jmp", "nop"]) && !is_changed && !i.in?(changed)
        is_changed = true
        changed << i

        op = (op == "jmp" ? "nop" : "jmp")
      end

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
  rescue
    # Program terminated
    puts acc # => 846
    break
  end
end
