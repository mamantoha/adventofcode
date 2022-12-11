# lines = File.read("input_example.txt").split("\n\n").map(&.lines.map(&.strip))
lines = File.read("input.txt").split("\n\n").map(&.lines.map(&.strip))

class Monkey
  getter name, operation, divisible, throw_to, inspected
  property items

  def initialize(
    @name : Int32,
    @items : Array(Int32),
    @operation : Tuple(Symbol, Int32),
    @divisible : Int32,
    @throw_to : Tuple(Int32, Int32)
  )
    @inspected = 0
  end

  def test(item : Int32)
    @inspected += 1

    item =
      case @operation[0]
      when :multiplied
        item * @operation[1]
      when :increases
        item + @operation[1]
      else
        item * item
      end

    item = item // 3

    item % @divisible == 0 ? {@throw_to[0], item} : {@throw_to[1], item}
  end
end

monkeys = [] of Monkey

lines.each do |line|
  name = line[0].match(/Monkey (\d+):/).try(&.[1].to_i).not_nil!

  items = line[1].match(/Starting items: (.+)/).try(&.[1].split(", ").map(&.to_i)).not_nil!

  operation =
    case
    when match = line[2].match(/Operation: new = old \* (\d+)/)
      # multiplied
      value = match[1].to_i
      {:multiplied, value}
    when match = line[2].match(/Operation: new = old \+ (\d+)/)
      # increases
      value = match[1].to_i
      {:increases, value}
    else
      # multiplied by itself
      # "Operation: new = old * old/
      {:multiplied_by_itself, 0}
    end

  divisible = line[3].match(/Test: divisible by (\d+)/).try(&.[1].to_i).not_nil!

  if_true = line[4].match(/If true: throw to monkey (\d+)/).try(&.[1].to_i).not_nil!
  if_false = line[5].match(/If false: throw to monkey (\d+)/).try(&.[1].to_i).not_nil!

  throw_to = {if_true, if_false}

  monkey = Monkey.new(name, items, operation, divisible, throw_to)
  monkeys << monkey
end

20.times do
  monkeys.each do |monkey|
    next if monkey.items.empty?

    monkey.items.size.times do
      item = monkey.items.shift

      monkey_name, new_item = monkey.test(item)
      if other_monkey = monkeys.find { |m| m.name == monkey_name }
        other_monkey.items << new_item
      end
    end
  end
end

p! monkeys.sort_by { |monkey| monkey.inspected }.last(2).product(&.inspected)
# 120056
