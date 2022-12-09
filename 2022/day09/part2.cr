# steps = File.read_lines("input_example1.txt").map(&.split)
# steps = File.read_lines("input_example2.txt").map(&.split)
steps = File.read_lines("input.txt").map(&.split)

visited = Set.new([{0, 0}])

# {y, x}
head_pos = {0, 0}

rope_state = Array.new(10) { {0, 0} }

steps.each do |(dir, count)|
  count = count.to_i

  count.times do |_i|
    new_rope_state = [] of Tuple(Int32, Int32)

    head_pos = rope_state.first

    case dir
    when "R"
      head_pos = {head_pos[0], head_pos[1] + 1}
    when "L"
      head_pos = {head_pos[0], head_pos[1] - 1}
    when "U"
      head_pos = {head_pos[0] + 1, head_pos[1]}
    when "D"
      head_pos = {head_pos[0] - 1, head_pos[1]}
    end

    new_rope_state << head_pos

    1.upto(9) do |i|
      new_rope_state << move(new_rope_state.last, rope_state[i])
    end

    rope_state = new_rope_state

    visited << rope_state.last unless visited.includes?(rope_state.last)
  end
end

def move(head_pos, tail_pos)
  return tail_pos if is_neighbor?(head_pos, tail_pos)

  case
  when head_pos[0] > tail_pos[0] && head_pos[1] == tail_pos[1]
    # [↑]
    tail_pos = {tail_pos[0] + 1, tail_pos[1]}
  when head_pos[0] < tail_pos[0] && head_pos[1] == tail_pos[1]
    # [↓]
    tail_pos = {tail_pos[0] - 1, tail_pos[1]}
  when head_pos[0] == tail_pos[0] && head_pos[1] < tail_pos[1]
    # [←]
    tail_pos = {tail_pos[0], tail_pos[1] - 1}
  when head_pos[0] == tail_pos[0] && head_pos[1] > tail_pos[1]
    # [→]
    tail_pos = {tail_pos[0], tail_pos[1] + 1}
  when head_pos[0] > tail_pos[0] && head_pos[1] > tail_pos[1]
    # [↗]
    tail_pos = {tail_pos[0] + 1, tail_pos[1] + 1}
  when head_pos[0] < tail_pos[0] && head_pos[1] < tail_pos[1]
    # [↙]
    tail_pos = {tail_pos[0] - 1, tail_pos[1] - 1}
  when head_pos[0] < tail_pos[0] && head_pos[1] > tail_pos[1]
    # [↘]
    tail_pos = {tail_pos[0] - 1, tail_pos[1] + 1}
  when head_pos[0] > tail_pos[0] && head_pos[1] < tail_pos[1]
    # [↖]
    tail_pos = {tail_pos[0] + 1, tail_pos[1] - 1}
  end

  tail_pos
end

def is_neighbor?(head : Tuple(Int32, Int32), tail : Tuple(Int32, Int32)) : Bool
  [head[0] - 1, head[0], head[0] + 1].includes?(tail[0]) &&
    [head[1] - 1, head[1], head[1] + 1].includes?(tail[1])
end

# p! head_pos
# p! tail_pos
# p! visited

p! visited.size
# 2427
