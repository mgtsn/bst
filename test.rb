require "./bst"

a = [1, 3, 5, 4, 3, 2, 7, 1, 6, 8]
n = [1, 2, 3, 4]

tn = Tree.new(n)

p tn.depth_first

tn.delete(1)

p tn.depth_first
