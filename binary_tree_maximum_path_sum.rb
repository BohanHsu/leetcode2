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
def max_path_sum(root)
  visited = {}

  stack = [root]
  while !stack.empty? do
    n = stack.last

    if n.left.nil? && n.right.nil?
      n = stack.pop
      visited[n] = n.val
    else
      if (n.left.nil? || visited.has_key?(n.left)) && (n.right.nil? || visited.has_key?(n.right))
        n = stack.pop
        childs_val = [0]
        childs_val << visited[n.left] if !n.left.nil?
        childs_val << visited[n.right] if !n.right.nil?
        visited[n] = childs_val.max + n.val
      else
        if !n.left.nil?
          stack << n.left
        end

        if !n.right.nil?
          stack << n.right
        end
      end
    end
  end

  cur_max = -Float::INFINITY
  visited.each do |k, v|
    n = k
    cur_max = [(n.left.nil? ? 0 : visited[n.left] > 0 ? visited[n.left] : 0) + (n.right.nil? ? 0 : visited[n.right] > 0 ? visited[n.right] : 0) + n.val, cur_max].max
  end

  cur_max
end
