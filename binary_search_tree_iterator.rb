# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class BSTIterator
  # @param {TreeNode} root
  def initialize(root)
    @stack = []
    n = root
    while !n.nil? do
      @stack << n
      n = n.left
    end
  end

  # @return {Boolean}
  def has_next
    return !@stack.empty?
  end

  # @return {Integer}
  def next
    node = @stack.pop
    res = node.val
    node = node.right
    while !node.nil? do
      @stack << node
      node = node.left
    end
    return res
  end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end
