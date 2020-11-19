class Node
  attr_accessor :value, :left_node, :right_node

  private

  def initialize(value = nil, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end
end

class Tree
  attr_accessor :root

  private

  def build_tree(values)
    return Node.new if values.length == 0

    middle = values.length / 2
    middle_value = values[middle]
    left = values.take(middle)
    right = values.drop(middle + 1)

    Node.new(middle_value, build_tree(left), build_tree(right))
  end

  def initialize(values)
    values.sort!.uniq!
    @root = build_tree(values)
  end
end
