template, pairs = File.read("input").split("\n\n")

pair_insertion_rules = {} of String => Char

pairs = pairs.lines.map(&.split(" -> "))
pairs.each do |(a, b)|
  pair_insertion_rules[a] = b.chars.first
end

steps = 10

1.upto(steps).each do |step|
  new_chars = [] of Char

  template.chars.each_cons(2).to_a.each_with_index(2) do |(a, b), i|
    new_chars << a

    if (between = pair_insertion_rules[[a, b].join])
      new_chars << between
    else
      new_chars << b
    end

    # Add closing char
    if template.size == i
      new_chars << b
    end
  end

  template = new_chars.join
end

min, max = template.chars.tally.minmax_of { |k, v| v }
p max - min
# => 2937
