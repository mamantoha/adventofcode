lines = File.read_lines("input")

regex = /Step (?<first>\w+) must be finished before step (?<second>\w+) can begin/

class Step
  getter name, next_steps, prev_steps

  def initialize(@name : String)
    @next_steps = [] of Step
    @prev_steps = [] of Step
  end
end

steps = Hash(String, Step).new { |h, k| h[k] = Step.new(k) }

lines.each do |line|
  if m = line.match(regex)
    step1 = steps[m["first"]]
    step2 = steps[m["second"]]
    step1.next_steps << step2
    step2.prev_steps << step1
  end
end

result = [] of String

available_steps = steps.values.select { |step| step.prev_steps.empty? }

steps.size.times do
  available_steps.sort_by!(&.name)

  step = available_steps.shift
  result << step.name

  new_available_steps = step.next_steps.select do |next_step|
    next_step.prev_steps.delete(step)
    next_step.prev_steps.empty?
  end

  available_steps.concat(new_available_steps)
end

puts result.join
