class Tree
  require_relative 'node'
  attr_accessor :root
  
  def initialize(arr)
    sorted_arr = arr.uniq.sort
    @root = self.build_tree(sorted_arr)
  end

  def build_tree(arr)
    root_value = arr[arr.length / 2]
    root_index = arr.length / 2
    this_node = Node.new(root_value, arr[0..root_index - 1], arr[root_index + 1..arr.length])
    if (this_node.left[0] <=> this_node.data) != 0
      build_tree(this_node.left)
    else
      return this_node.data
    end
    if (this_node.right[0] <=> this_node.data) != 0
      build_tree(this_node.right)
    else
      return this_node.data
    end 
    this_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

