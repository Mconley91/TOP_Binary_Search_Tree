require_relative 'tree'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

test.insert(0)
test.insert(2)
test.insert(14)
test.insert(6)
p test.find(23)
test.delete(23)
test.pretty_print
