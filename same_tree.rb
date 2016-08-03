# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  queuep = p.nil? ? [] : [p]
  queueq = q.nil? ? [] : [q]

  while !queuep.empty? || !queueq.empty? do
    if queuep.length != queueq.length
      return false
    end

    np = queuep.shift
    nq = queueq.shift

    if np.val != nq.val
      return false
    end

    if !np.left.nil? && !nq.left.nil?
      queuep << np.left
      queueq << nq.left
    elsif !(np.left.nil? && nq.left.nil?)
      return false
    end

    if !np.right.nil? && !nq.right.nil?
      queuep << np.right
      queueq << nq.right
    elsif !(np.right.nil? && nq.right.nil?)
      return false
    end
  end

  true
end
