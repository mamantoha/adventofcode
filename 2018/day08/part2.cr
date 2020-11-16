numbers = File.read("input").split.map(&.to_i)

class Node
  property child_nodes = [] of Node
  property metadata_entries = [] of Int32

  def value : Int32
    if child_nodes.empty?
      metadata_entries.sum
    else
      metadata_entries.map do |i|
        child_nodes[i - 1]?.try(&.value) || 0
      end.sum
    end
  end
end

def perform(numbers : Array(Int32)) : Node
  node = Node.new

  child_nodes = numbers.shift
  metadata_entries = numbers.shift

  child_nodes.times do
    node.child_nodes << perform(numbers)
  end

  metadata_entries.times do
    node.metadata_entries << numbers.shift
  end

  node
end

puts perform(numbers).value
