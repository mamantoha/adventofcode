template, pairs = File.read("input").split("\n\n")

rules = {} of Array(Char) => Char

pairs.lines.map(&.split(" -> ")).each do |(a, b)|
  rules[a.chars] = b.chars.first
end

pairs = Hash(Array(Char), Int64).new { 0_i64 }

template.chars.each_cons(2).each do |pair|
  pairs[pair] += 1
end

counts = Hash(Char, Int64).new { 0_i64 }
template.chars.each { |chr| counts[chr] += 1_i64 }

# ---

steps = 40

1.upto(steps).each do |step|
  # p "After step #{step}"

  new_pairs = Hash(Array(Char), Int64).new { 0_i64 }

  pairs.each do |pair, count|
    counts[rules[pair]] += count

    new_pairs[[pair[0], rules[pair]]] += count
    new_pairs[[rules[pair], pair[1]]] += count
  end

  pairs = new_pairs

  # p! pairs
  # p! counts
  # min, max = counts.minmax_of { |k, v| v }
  # p max - min
end

min, max = counts.minmax_of { |k, v| v }
p max - min

# => 3390034818249
