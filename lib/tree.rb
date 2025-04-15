class Tree
  require_relative 'node'
  attr_accessor :root, :sorted_arr
  
  def initialize(arr)
    @sorted_arr = arr.uniq.sort
    @root = self.build_tree(@sorted_arr)
  end

  def build_tree(input)
    root_index = input.length / 2
    if root_index == 0 && input[root_index]
      return Node.new(input[root_index])
    elsif input[root_index]
      Node.new(input[root_index], build_tree(input[0..root_index - 1]), build_tree(input[root_index + 1..input.length]))
    end
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

  def delete(num)
    node = find(num)
    if !node.left && !node.right
      node.data = nil
    elsif node.left && !node.right
      temp = node.left
      node.data = temp.data
      node.left = temp.left
      node.right = temp.right
    elsif !node.left && node.right
      temp = node.right
      node.data = temp.data
      node.left = temp.left
      node.right = temp.right
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

  def find(num, node = root)
    if num == node.data
      return node
    elsif num > node.data
      find(num,node.right)
    else
      find(num,node.left)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" if node.data
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

