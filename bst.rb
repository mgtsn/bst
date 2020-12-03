class Node
  include Comparable
  attr_accessor :value, :left_node, :right_node

  def <=>(other)
    self.value <=> other.value
  end

  def is_leaf?
    nil == self.left_node and nil == self.right_node
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

  #create tree from array of values
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

  #insert new node with given value
  def insert_helper(current_node, key)
    return Node.new(key) if nil == current_node

    v = current_node.value

    if v == key
      return current_node
    elsif v > key
      current_node.left_node = insert_helper(current_node.left_node, key)
    elsif v < key
      current_node.right_node = insert_helper(current_node.right_node, key)
    end
    current_node
  end

  #calls itself recursively on left or right subtree
  def find_helper(current_node, key)
    return nil if current_node.nil?
    return current_node if current_node.value == key

    if key < current_node.value
      return find_helper(current_node.left_node, key)
    else
      return find_helper(current_node.right_node, key)
    end
  end

  public

  def find_parent(current_node, key)
    return nil if @root.value == key
    # if current_node.left_node.value == key

    l = current_node.left_node
    r = current_node.right_node

    unless l.nil?
      return current_node if l.value == key
    end

    unless r.nil?
      return current_node if r.value == key
    end

    if key < current_node.value
      return find_parent(l, key)
    else
      return find_parent(r, key)
    end
  end

  def find_successor(current_node, key)
  end

  #return array of values from depth first traversal
  def depth_first(current_node = @root)
    if nil == current_node
      return []
    elsif current_node.is_leaf?
      return [current_node.value]
    else
      l_node = current_node.left_node
      r_node = current_node.right_node
      return [current_node.value] + (depth_first(l_node) + depth_first(r_node))
    end
  end

  def display
  end

  #public

  #returns the node with the given key, or nil if it is not present
  def find(key)
    find_helper(@root, key)
  end

  #inserts given value as a leaf node
  def insert(key)
    @root = insert_helper(@root, key)
  end

  def delete(key)
    target_node = find(key)

    l = target_node.left_node
    r = target_node.right_node

    if l.nil? and r.nil?
      parent_node = find_parent(@root, key)
      parent_node.value = key
      if key == parent_node.left_node.value
        parent_node.left_node = nil
      else
        parent_node.right_node = nil
      end
    elsif l.nil?
      target_node.value = r.value
      target_node.left_node = r.left_node
      target_node.right_node = r.right_node
    elsif r.nil?
      target_node.value = l.value
      target_node.right_node = l.right_node
      target_node.left_node = l.left_node
    else
      puts "both"
      # successor = find_successor(@head, key)
      # target_node.value = successor.value
      # delete(successor)
    end
  end

  def height(target_node)
    if nil == target_node
      return -1
    elsif target_node.is_leaf?
      return 0
    else
      return [height(target_node.left_node) + 1, height(target_node.right_node) + 1].max
    end
  end
end
