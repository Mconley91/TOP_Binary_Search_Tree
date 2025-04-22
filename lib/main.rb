require_relative 'tree'

# test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

driver = Tree.new((Array.new(15) { rand(1..100) }))

driver.insert(222)
driver.insert(102)
driver.insert(345)
driver.insert(777)
driver.insert(150)
driver.insert(800)
driver.insert(850)
driver.insert(900)
driver.pretty_print
puts "Is the Tree Balanced?: #{driver.balanced? ? 'Yes' : 'No'}"
puts '---------------------'
driver.rebalance
driver.pretty_print
puts "Is the Tree Balanced?: #{driver.balanced? ? 'Yes' : 'No'}"
arr = []
driver.level_order.each {|node| arr << node.data}
puts " Level Order: #{arr}"
arr = []
puts '---'
driver.inorder.each {|node| arr << node.data}
puts " In Order: #{arr}"
arr = []
puts '---'
driver.preorder.each {|node| arr << node.data}
puts " Pre Order: #{arr}"
arr = []
puts '---'
driver.postorder.each {|node| arr << node.data}
puts " Post Order: #{arr}"
arr = []