require "./bst"

a = [1, 3, 5, 4, 3, 2, 7, 1, 6, 8]

t = Tree.new(a)

p t.root.left_node.value
