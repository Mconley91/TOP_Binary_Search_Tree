require_relative 'tree'

# test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

driver = Tree.new((Array.new(15) { rand(1..100) }))

# driver.pretty_print
# p "Is the Tree Balanced?: #{driver.balanced? ? 'Yes' : 'No'}"
# driver.inorder.each {|node| puts node.data}
# p '---'
# driver.preorder.each {|node| puts node.data}
# p '---'
# driver.postorder.each {|node| puts node.data}

driver.insert(222)
driver.insert(102)
driver.insert(345)
driver.insert(777)
driver.insert(150)
driver.insert(800)
driver.insert(850)
driver.insert(900)
driver.pretty_print
p "Is the Tree Balanced?: #{driver.balanced? ? 'Yes' : 'No'}"
p '---------------------'
driver.rebalance
driver.pretty_print
p "Is the Tree Balanced?: #{driver.balanced? ? 'Yes' : 'No'}"