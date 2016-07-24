# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  return true if root.nil?
  hsh = {}
  height(root, hsh)

  queue = [root]
  while !queue.empty? do
    n = queue.shift
    if !n.left.nil? && !n.right.nil?
      if (hsh[n.left] - hsh[n.right]).abs > 1
        return false
      end
      queue << n.left
      queue << n.right
    elsif !n.left.nil? && n.right.nil?
      if (hsh[n.left]) > 1
        return false
      end
      queue << n.left
    elsif n.left.nil? && !n.right.nil?
      if (hsh[n.right]) > 1
        return false
      end
      queue << n.right
    end
  end
  true
end

def height(n, hsh)
  if hsh.has_key?(n)
    return hsh[n]
  end

  if n.left.nil? && n.right.nil?
    hsh[n] = 1
    return hsh[n]
  end

  compare = []
  if !n.left.nil?
    compare << height(n.left, hsh) + 1
  end

  if !n.right.nil?
    compare << height(n.right, hsh) + 1
  end

  hsh[n] = compare.max
  return hsh[n]
end
