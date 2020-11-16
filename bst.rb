class Node
  private

  def initialize(value = nil, left_node = nil, right_node = nil)
    @value = value
    @left_node = left_node
    @right_node = right_node
  end

  public
end

class Tree
  attr_accessor :root

  private

  def build_tree(values)
    values.sort!.uniq!
  end

  def initialize(values)
    @root = build_tree(values)
  end
end
