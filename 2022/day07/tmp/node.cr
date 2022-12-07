class Node
  getter name, parent, size
  property children

  def initialize(@parent : Node? = nil, @name : String? = nil, @size : Int32 = 0)
    @children = [] of Node
  end

  def root?
    parent.nil?
  end

  def path : String
    if _parent = parent
      [_parent.path, name].join('/')
    else
      ""
    end
  end

  def total_size(node : Node = self, acc = 0) : Int32
    node.children.each do |child|
      acc += child.size

      acc = total_size(child, acc)
    end

    acc
  end
end

# Create the root node with no parent
root = Node.new

# Create a few child nodes with the root node as their parent
child1 = Node.new(root, "child1", 1)
child2 = Node.new(root, "child2", 5)
child3 = Node.new(root, "child3")

# Add the child nodes to the root node's list of children
root.children << child1
root.children << child2
root.children << child3

# Create a leaf node with child2 as its parent and no children
leaf = Node.new(child3, "leaf", 10)
p! leaf.path
child2.children << leaf

p root.total_size
p root.path
