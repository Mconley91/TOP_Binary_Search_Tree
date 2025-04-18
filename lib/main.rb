require_relative 'tree'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

test.insert(0)
test.insert(2)
test.insert(14)
test.insert(6)
# test.delete(67)
# test.delete(8)
# test.delete(4)
# test.delete(1)
test.pretty_print
# test.level_order.each {|value| p value.data}
# test.inorder.each {|value| p value.data}
# test.preorder.each {|value| p value.data}
# test.postorder.each {|value| p value.data}
# p test.depth(0)
p test.balanced?