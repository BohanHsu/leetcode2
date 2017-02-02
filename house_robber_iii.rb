# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer}
def rob(root)
  return 0 if root.nil?

  best_value = {}
  return calculate_best_value(best_value, root)
end

def calculate_best_value(best_value, node)
  if best_value.has_key?(node)
    return best_value[node]
  end

  not_rob_node = 0
  rob_node = node.val

  if !node.left.nil?
    not_rob_node += calculate_best_value(best_value, node.left)

    if !node.left.left.nil?
      rob_node += calculate_best_value(best_value, node.left.left)
    end
    if !node.left.right.nil?
      rob_node += calculate_best_value(best_value, node.left.right)
    end
  end

  if !node.right.nil?
    not_rob_node += calculate_best_value(best_value, node.right)

    if !node.right.left.nil?
      rob_node += calculate_best_value(best_value, node.right.left)
    end
    if !node.right.right.nil?
      rob_node += calculate_best_value(best_value, node.right.right)
    end
  end

  best_result = [not_rob_node, rob_node].max
  best_value[node] = best_result
  return best_result
end
