class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node

  def <=>(other)
    self.value <=> other.value
  end

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
    return nil if values.length == 0

    middle = values.length / 2
    middle_value = values[middle]
    left = values.take(middle)
    right = values.drop(middle + 1)

    Node.new(middle_value, build_tree(left), build_tree(right))
  end

  def initialize(values)
    @root = build_tree(values.sort.uniq)
  end

  def insert_helper(current_node, key)
    begin
      return Node.new(key) if current_node == nil
    rescue
      v = current_node.value

      if v == key
        return current_node
      elsif v > key
        current_node.left_node = insert_helper(current_node.left_node, key)
      elsif v < key
        current_node.right_node = insert_helper(current_node.right_node, key)
      end
    end
    current_node
  end

  public

  def insert(key)
    begin
      @root = Node.new(key) if @root == nil
    rescue
      @root = insert_helper(@root, key)
    end
  end

  def delete(key)
  end
end
