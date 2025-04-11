class Tree
  require_relative 'node'
  attr_accessor :iteration
  
  def initialize(arr)
    sorted_arr = arr.uniq.sort
    @root = self.build_tree(sorted_arr)
  end

  def build_tree(sorted_arr)
    sorted_arr[0] ? '' : return
    root_index = sorted_arr.length / 2
    this_node = Node.new(sorted_arr[root_index], sorted_arr[0..root_index - 1], sorted_arr[root_index + 1..sorted_arr.length])
    if this_node.left != sorted_arr
      build_tree(this_node.left)
    else
      return sorted_arr[root_index]
    end
    if this_node.right != sorted_arr
      build_tree(this_node.right)
    else
      return sorted_arr[root_index]
    end
    sorted_arr[root_index]
    # this_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
 
end

p "#{@root} is the value of @root"