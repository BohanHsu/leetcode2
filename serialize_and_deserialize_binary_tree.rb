# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  return "" if root.nil?
  node_to_num = {root => 1}
  num_to_val = {}
  
  queue = [root]

  while !queue.empty? do
    node = queue.shift
    num_to_val[node_to_num[node]] = node.val

    if !node.left.nil?
      node_to_num[node.left] = node_to_num[node] * 2
      queue << node.left
    end

    if !node.right.nil?
      node_to_num[node.right] = node_to_num[node] * 2 + 1
      queue << node.right
    end
  end

  return num_to_val.keys.map do |k|
    "#{k}=#{num_to_val[k]}"
  end.join(",")
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  return nil if data == ""
  maps = data.split(/,/)
  num_to_val = {}
  maps.each do |pair|
    pair = pair.split(/=/)
    num_to_val[pair[0].to_i] = pair[1].to_i
  end

  num_to_node = {1 => TreeNode.new(nil)}
  queue = [1]

  while !queue.empty? do
    num = queue.shift
    val = num_to_val[num]
    node = num_to_node[num]
    node.val = val

    if num_to_val.has_key?(num * 2)
      num_to_node[num * 2] = TreeNode.new(nil)
      node.left = num_to_node[num * 2]
      queue << num * 2
    end

    if num_to_val.has_key?(num * 2 + 1)
      num_to_node[num * 2 + 1] = TreeNode.new(nil)
      node.right = num_to_node[num * 2 + 1]
      queue << num * 2 + 1
    end
  end

  return num_to_node[1]
end


# Your functions will be called as such:
# deserialize(serialize(data))
