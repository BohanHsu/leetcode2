require 'minitest/autorun'
require '../kth_smallest_element_in_a_bst'

describe 'kth_smallest(root, k)' do
  it 'should work1' do
    array = [200, 100,300,50,150,nil,350,nil,nil,125,175,nil,nil,325]
    sorted_array = array.select{|i| !i.nil?}.sort
    root = convert_array_to_tree(array)

    (1..array.select{|i| !i.nil?}.length).each do |k|
      kth_smallest(root, k).must_equal(sorted_array[k-1])
    end
  end

  it 'should work2' do
    array = [200, 100,300,50,150,nil,350,nil,nil,125,175,nil,nil,325]
    sorted_array = array.select{|i| !i.nil?}.sort
    root = convert_array_to_tree(array)

    k = 2
    kth_smallest(root, k).must_equal(sorted_array[k-1])
  end
end

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
