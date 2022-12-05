# file_path = "input_example.txt"
file_path = "input.txt"

content = File.read(file_path)
stacks_str, steps = content.split("\n\n")

stacks_count = stacks_str.split('\n').last.split.last.to_i

stacks = Array.new(stacks_count) { Array(String?).new }

stacks_str.split('\n').reverse[1..].each do |line|
  # Crates in a row
  # puts line.scan(/.{1,4}/) # Array(Regex::MatchData)
  # puts line.scan(/.{1,4}/).map { |md| md[0] } # Array(String)
  crates =
    line
      .scan(/.{1,4}/)
      .map { |md| md[0] }
      .map { |s| s.match(/\[(.*)\]/).try(&.[1]) } # Array(String | Nil)

  stacks_count.times do |i|
    stacks[i] << crates[i]?
  end
end

stacks = stacks.map(&.compact)

steps.split('\n').each do |step|
  if (m = step.match(/move (\d+) from (\d+) to (\d+)/))
    count = m[1].to_i
    from = m[2].to_i - 1
    to = m[3].to_i - 1

    crates = stacks[from].pop(count)
    stacks[to] += crates.reverse
  end
end

p stacks.map(&.last).join

# QNHWJVJZW
