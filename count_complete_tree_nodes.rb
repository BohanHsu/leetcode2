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
def count_nodes(root)
  return 0 if root.nil?

  max_depth = 0
  n = root
  while !n.nil? do
    max_depth += 1
    n = n.left
  end
  return 1 if max_depth == 1

  last_row = {(2 ** (max_depth - 1)) => false}

  from = 0
  to = 2 ** (max_depth - 1)
  mid = 2 ** (max_depth - 2)

  while !is_last(mid, last_row, root, max_depth) do
    direction = move_direction(mid, last_row)
    if direction == :move_to
      to = mid
    else
      from = mid
    end
    mid = (from + to) / 2
  end
  return 2 ** (max_depth - 1) + mid
end

def is_last(i, hash, root, max_depth)
  if !hash.has_key?(i)
    hash[i] = !get_ith_node_in_last_row(root, i, max_depth).nil?
  end
  if !hash.has_key?(i+1)
    hash[i+1] = !get_ith_node_in_last_row(root, i+1, max_depth).nil?
  end

  return hash[i] && !hash[i+1]
end

def move_direction(i, hash)
  !hash[i] && !hash[i+1] ? :move_to : :move_from
end

def get_ith_node_in_last_row(root, i, max_depth)
  n = root
  (max_depth-1).times do |cur_depth|
    if (i >> (max_depth - 2 - cur_depth)) & 1 == 0
      n = n.left
    else
      n = n.right
    end
  end
  n
end
