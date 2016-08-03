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
def is_symmetric(root)
  return true if root.nil?
  return root.left.nil? if root.right.nil?

  #mirror_tree(root.right)
  queue = [root.right]
  while !queue.empty? do
    n = queue.shift
    tmp = n.left
    n.left = n.right
    n.right = tmp

    if !n.left.nil?
      queue << n.left
    end

    if !n.right.nil?
      queue << n.right
    end
  end

  queueleft =  root.left.nil? ? [] : [root.left]
  queueright = root.right.nil? ? [] : [root.right]

  while !queueleft.empty? || !queueright.empty? do
    if queueleft.length != queueright.length
      return false
    end

    nleft = queueleft.shift
    nright = queueright.shift

    if nleft.val != nright.val
      return false
    end

    if (!nleft.left.nil?) && (!nright.left.nil?)
      queueleft << nleft.left
      queueright << nright.left
    elsif !(nleft.left.nil? && nright.left.nil?)
      return false
    end

    if (!nleft.right.nil?) && (!nright.right.nil?)
      queueleft << nleft.right
      queueright << nright.right
    elsif !(nleft.right.nil? && nright.right.nil?)
      return false
    end
  end

  true
end

def mirror_tree(root)
  queue = [root]
  while !queue.empty? do
    n = queue.shift
    tmp = n.left
    n.left = n.right
    n.right = tmp

    if !n.left.nil?
      queue << n.left
    end

    if !n.right.nil?
      queue << n.right
    end
  end
end
