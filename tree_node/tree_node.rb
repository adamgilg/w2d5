#check out this sleek lil' treenode class built by Excellent Erik and Adam Awesome.
class TreeNode

  attr_accessor :left, :right, :value

  def initialize(value)
    @value = value
  end

  def bfs(value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == value
      queue << current_node.left unless current_node.left.nil?
      queue << current_node.right unless current_node.right.nil?
    end
    false
  end

  def dfs(value)
    return self if @value == value
    if self.left
      result = self.left.dfs(value)
      return result if result
    end
    if self.right
      result = self.right.dfs(value)
      return result if result
    end
    nil
  end

end