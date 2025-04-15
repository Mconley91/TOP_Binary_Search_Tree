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
      return Node.new(input[root_index])
    end
    Node.new(input[root_index], build_tree(input[0..root_index - 1]), build_tree(input[root_index + 1..input.length]))
  end

  def insert(num, node = @root)
    if num == node.data
      p "Error: '#{num}' is invalid. Cannot insert value that already exists in tree!"
      return
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

  def delete(num, node = @root)
    if num > node.data
      if node.right.data == num
        #FOUND TARGET ON RIGHT
        lowest_node_on_right = find_lowest_in_tree(node.right.right)
        node.right = lowest_node_on_right.data ? lowest_node_on_right  : node.right.data
        node.right.right = nil
        return
      end
      delete(num, node.right)
    else
      if node.left.data == num
        #FOUND TARGET ON LEFT
        lowest_node_on_right = find_lowest_in_tree(node.left.right)
        node.left.data = lowest_node_on_right ? lowest_node_on_right.data : 'ERROR'
        node.left.right = nil
        return
      end
      delete(num,node.left)
    end
  end

  def find_lowest_in_tree(node)
    return if node == nil
    if node.left == nil
      return node
    else
      find_lowest_in_tree(node.left)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

