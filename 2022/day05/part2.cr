file_path = "input.txt"

content = File.read(file_path)
stacks_str, steps = content.split("\n\n")

stacks_count = stacks_str.split('\n').last.split.last.to_i

stacks = [] of Array(String?)

stacks_str.split('\n').reverse[1..].each do |line|
  crates = line.scan(/.{1,4}/).map { |md| md[0] }.map { |s| s.match(/\[(.*)\]/).try(&.[1]) }

  stacks_count.times do |i|
    v = crates[i]?

    if stacks[i]?
      stacks[i] << v
    else
      stacks << [v]
    end
  end
end

stacks = stacks.map(&.compact)

steps.split('\n').each do |step|
  if (m = step.match(/move (\d+) from (\d+) to (\d+)/))
    count = m[1].to_i
    from = m[2].to_i - 1
    to = m[3].to_i - 1

    crates = stacks[from].pop(count)
    crates.each { |crate| stacks[to] << crate }
  end
end

p stacks.map(&.last).join

# BPCZJLFJW
