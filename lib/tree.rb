class Tree
  require_relative 'node'
  attr_accessor :root, :sorted_arr
  
  def initialize(arr)
    @sorted_arr = arr.uniq.sort
    @root = self.build_tree(@sorted_arr)
    @balanced = true
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
    # return if node.data == nil
    # p "#{num} & #{node.data}"
    if num == node.data
      p "Error: '#{num}' is invalid. Cannot insert value that already exists in tree!"
      return
    end
    if node.data == nil 
      node.data = num
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
    elsif node.left && node.right
      lowest_node = find_lowest_in_tree(node.right)
      node.data = lowest_node.data
      if lowest_node.right
        temp = lowest_node.right.data
        delete(lowest_node.right.data) 
      end
      lowest_node.data = temp
    end
  end

  def find_lowest_in_tree(node)
    if !node.left
      return node
    else
      find_lowest_in_tree(node.left)
    end
  end

  def find(num, node = @root)
    return nil if !node || !num
    if num == node.data
      return node
    elsif num > node.data
      find(num,node.right)
    else
      find(num,node.left)
    end
  end

  def level_order(arr = [], node = @root, queue = [node], &block)
    return if !node
    if node.left then queue << node.left end
    if node.right then queue << node.right end
    block_given? ? yield(queue.shift) : arr << queue.shift
    level_order(arr, queue[0], queue, &block)
    return arr if !block_given?
  end

  def inorder(arr = [], node = @root, &block)
    return if !node
    inorder(arr, node.left, &block)
    block_given? ? yield(node) : arr << node
    inorder(arr, node.right, &block)
    return arr if !block_given?
  end

  def preorder(arr = [], node = @root, &block)
    return if !node
    block_given? ? yield(node) : arr << node
    preorder(arr, node.left, &block)
    preorder(arr, node.right, &block)
    return arr if !block_given?
  end

  def postorder(arr = [], node = @root, &block)
    return if !node
    postorder(arr, node.left, &block)
    postorder(arr, node.right, &block)
    block_given? ? yield(node) : arr << node
    return arr if !block_given?
  end

  def height(num, node = find(num))
    # return nil if !find(num)
    return -1 if !node || node.data == nil
    left_height = height(num, node.left)
    right_height = height(num, node.right)
    return left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(num, node = @root)
    return nil if !find(num)
    return 0 if node == find(num)
    return num > node.data ? depth(num, node.right) + 1 : depth(num, node.left) + 1
  end

  def balanced?
    @balanced = true
    inorder do|node| 
      if height(node.left ? node.left.data : 0) - height(node.right ? node.right.data : 0) > 1
        @balanced = false
      end
    end
    @balanced
  end

  def rebalance
    if self.balanced?
      p "Tree is already balanced"
      return
    end
    inorder do|node| 
      left = height(node.left ? node.left.data : 0)
      right = height(node.right ? node.right.data : 0)
      if left - right > 1
        if left > right
          #add node to right branch
          insert(node.data + 1)
        else
          #add node to left branch
          insert(node.data - 1)
        end
        if !balanced?
          rebalance
        end
      end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" if node.data
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

