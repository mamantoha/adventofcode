def input
  File.read_lines("input.txt").map(&.chomp.split)
end

RELEVANT_CYCLES = [20, 60, 100, 140, 180, 220]
WIDTH = 40

def execute(action)
  x, cycle = 1, 0

  input.each_with_object([] of String) do |line, output|
    instruction = line[0]
    argument = line[1]?

    case instruction
    when "noop"
      output << action.call(x, cycle)

      cycle += 1
    when "addx"
      2.times do
        output << action.call(x, cycle)

        cycle += 1
      end

      x += argument.to_i if argument
    end
  end
end

def render_output(output)
  output.each_slice(WIDTH).map { |row| row.join }.join("\n")
end

puts render_output(
  execute(
    -> (x : Int32, pos : Int32) { [x - 1, x, x + 1].includes?(pos % WIDTH) ? "█" : " " }
  )
)

# ████  ██  ████ █  █ ████  ██  █    ███
# █    █  █    █ █  █    █ █  █ █    █  █
# ███  █      █  █  █   █  █  █ █    █  █
# █    █     █   █  █  █   ████ █    ███
# █    █  █ █    █  █ █    █  █ █    █ █
# ████  ██  ████  ██  ████ █  █ ████ █  █
