# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  return [] if n == 0
  hsh = {
    0 => [nil],
    1 => [TreeNode.new(nil)]
  }

  i = 2
  while i <= n do
    cur_level = []
    (0...i).each do |j|
      hsh[j].each do |left_root|
        hsh[i-1-j].each do |right_root|
          rt = TreeNode.new(nil)
          rt.left = copy_tree_structure(left_root)
          rt.right = copy_tree_structure(right_root)
          cur_level << rt
        end
      end
    end

    hsh[i] = cur_level
    i += 1
  end

  hsh[n].each do |rt|
    assign_value(rt)
  end

  return hsh[n]
end

def assign_value(root)
  return nil if root.nil?
  @cnt = 1

  def visit(n)
    n.val = @cnt
    @cnt += 1
  end

  def in_order_traverse(n)
    in_order_traverse(n.left) if !n.left.nil?
    visit(n)
    in_order_traverse(n.right) if !n.right.nil?
  end

  in_order_traverse(root)
end

def copy_tree_structure(root)
  return nil if root.nil?
  
  map = {root => TreeNode.new(nil)}
  queue = [root]

  while !queue.empty? do
    n = queue.shift
    if !n.left.nil?
      map[n.left] = TreeNode.new(nil)
      map[n].left = map[n.left]
      queue << n.left
    end

    if !n.right.nil?
      map[n.right] = TreeNode.new(nil)
      map[n].right = map[n.right]
      queue << n.right
    end
  end

  return map[root]
end
