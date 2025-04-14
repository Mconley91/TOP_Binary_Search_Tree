class Tree
  require_relative 'node'
  attr_accessor :root, :sorted_arr
  
  def initialize(arr)
    @sorted_arr = arr.uniq.sort
    @root = self.build_tree(@sorted_arr)
  end

  def build_tree(input)
    root_index = input.length / 2
    if root_index == 0
      return input[root_index] == nil ? Node.new('nil') : Node.new(input[root_index])
    end
    Node.new(input[root_index], build_tree(input[0..root_index - 1]), build_tree(input[root_index + 1..input.length]))
  end

  def insert(num, node = @root)
    if num == node.data
      p "cannot insert duplicate nodes"
    end
    if num > node.data
      if node.right == nil
        node.right = Node.new(num)
        return
      end
      insert(num, node.right)
    else
      if node.left == nil
        node.left = Node.new(num)
        return
      end
      insert(num, node.left)
    end
  end

  def delete(num)
    
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

