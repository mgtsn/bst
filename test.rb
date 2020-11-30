require "./bst"

a = [1, 3, 5, 4, 3, 2, 7, 1, 6, 8]
n = [1, 2, 3]

tn = Tree.new(a)

# p tn

# p tn.find(2).right_node.value
# tn.delete(2)
# p tn.find(3)

p tn.depth_first

tn.insert(0)

p tn.depth_first
