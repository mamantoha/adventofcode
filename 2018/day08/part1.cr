numbers = File.read("input").split.map(&.to_i)

def perform(numbers : Array(Int32)) : Int32
  child_nodes = numbers.shift
  metadata_entries = numbers.shift

  sum = 0

  child_nodes.times do
    sum += perform(numbers)
  end

  metadata_entries.times do
    sum += numbers.shift
  end

  sum
end

puts perform(numbers)
