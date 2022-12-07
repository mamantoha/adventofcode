class Node
  getter name, parent, size
  property children

  def initialize(@parent : Node? = nil, @name : String? = nil, @size : Int32 = 0)
    @children = [] of Node
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

# iter = File.read_lines("input_example.txt").each
iter = File.read_lines("input.txt").each

# First line is always  `$ cd /`. Skipping...
line = iter.next

root = Node.new

current_node = root

line = iter.next

loop do
  run_next_command = true

  break if line.is_a?(Iterator::Stop)

  if line.starts_with?('$')
    command, *args = line.lchop("$ ").split(2)

    case command
    when "cd"
      if args[0] == ".."
        if node = current_node
          current_node = node.parent
        end
      else
        if node = current_node
          current_node = node.children.find { |child| child.name == args[0] }
        end
      end
    when "ls"
      loop do
        line = iter.next

        break if line.is_a?(Iterator::Stop)

        if line.starts_with?('$')
          run_next_command = false

          break
        end

        dir_or_size, name = line.split

        size = (dir_or_size == "dir" ? 0 : dir_or_size.to_i)

        if node = current_node
          child = Node.new(node, name, size)
          node.children << child
        end
      end
    end
  end

  line = iter.next if run_next_command
end

def collect_sizes(node : Node, hash = {} of String => Int32)
  node.children.each do |child|
    hash[child.path] = child.total_size

    hash = collect_sizes(child, hash)
  end

  hash
end

available = 70000000
needed_unused_size = 30000000
total_size = root.total_size
unused_size = available - total_size

hash = collect_sizes(root)

print "Part 1:"
puts hash.select { |k, v| v <= 100000 }.values.sum
# 1307902

print "Part 2:"
puts hash.select { |k, v| unused_size + v >= 30000000 }.values.min
# 7068748
