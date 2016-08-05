require 'minitest/autorun'
require '../recover_binary_search_tree'

describe 'recover_tree(root)' do
  it 'should work1' do
    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [100,50,150,30,120,80,170]
    #puts "wrong_tree=#{wrong_tree}"
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [150,50,100,30,80,120,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [120,50,150,30,80,100,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [80,50,150,30,100,120,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [50,100,150,30,80,120,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [100,80,150,30,50,120,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [100,50,150,30,80,120,170]
    wrong_tree = [100,30,150,50,80,120,170]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [1,nil,2,nil,nil,nil,3]
    wrong_tree = [3,nil,2,nil,nil,nil,1]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [4,3,nil,1] + [nil] * 4 + [2]
    wrong_tree = [4,2,nil,1] + [nil] * 4 + [3]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [1,0]
    wrong_tree = [0,1]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)

    correct_tree = [0,nil,1]
    wrong_tree = [1,nil,0]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)
  end

  it 'should work2' do
    correct_tree = [146,71,321,55,nil,231,399,-31] + [nil] * 7 + [-33]
    wrong_tree = [146,71,-13,55,nil,231,399,321] + [nil] * 7 + [-33]
    root = convert_array_to_tree(wrong_tree)
    recover_tree(root)
    convert_tree_to_array(root).must_equal(correct_tree)
  end
end

#[146,71,-13,55,null,231,399,321,null,null,null,null,null,-33]
#
#
#
#                          146
#             /                         \
#             71                        -13
#     /              \          /                \
#     55             n         231               399
#   /      \     /      \    /      \          /      \
#   321    n     n      n    n      n          n      n
# /
# -33

def convert_array_to_tree(array)
  return nil if array.empty?
  array = array.map do |val|
    if !val.nil?
      TreeNode.new(val)
    else
      nil
    end
  end

  array.length.times do |i|
    if !array[(i + 1) * 2 - 1].nil?
      array[i].left = array[(i + 1) * 2 - 1]
    end
    if !array[(i + 1) * 2].nil?
      array[i].right = array[(i + 1) * 2]
    end
  end

  return array[0]
end

def convert_tree_to_array(root)
  return [] if root.nil?
  node_to_idx = {root => 1}
  idx_to_val = {}
  queue = [root]
  max_idx = 1

  while !queue.empty? do
    n = queue.shift
    idx = node_to_idx[n]
    idx_to_val[idx] = n.val

    max_idx = [max_idx, idx].max

    if !n.left.nil?
      queue << n.left
      node_to_idx[n.left] = idx * 2
    end

    if !n.right.nil?
      queue << n.right
      node_to_idx[n.right] = idx * 2 + 1
    end
  end

  array = max_idx.times.map {nil}
  idx_to_val.each do |k, v|
    array[k-1] = v
  end

  return array
end
