# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  @buffer = [TreeNode.new(-Float::INFINITY)] * 3
  @snd = nil
  @swaps = []

  def visit(n)
    if @buffer.length == 3
      @buffer.shift
    end
    @buffer << n

    if @buffer.length == 2
      if @buffer[0].val > @buffer[1].val
        @swaps << @buffer[0]
      end
    end

    if @buffer.length == 3
      if @buffer[0].val > @buffer[1].val && @buffer[1].val < @buffer[2].val
        @swaps << @buffer[1]
      end

      if @buffer[0].val < @buffer[1].val && @buffer[1].val > @buffer[2].val
        @swaps << @buffer[1]
      end
    end
  end

  def dfs(n)
    dfs(n.left) if !n.left.nil?
    visit(n)
    dfs(n.right) if !n.right.nil?
  end

  dfs(root)

  visit(TreeNode.new(Float::INFINITY))
  visit(TreeNode.new(Float::INFINITY))
  visit(TreeNode.new(Float::INFINITY))

  @fst = @swaps[0]
  @snd = @swaps[-1]

  tmp = @fst.val
  @fst.val = @snd.val
  @snd.val = tmp

  nil
end
