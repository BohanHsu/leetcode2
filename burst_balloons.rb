# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
  tree = Tree.new
  return max_coin_of_nums(tree, nums)
end

def max_coin_of_nums(tree, nums)
  val_in_tree = tree.get(nums)
  if !val_in_tree.nil?
    return val_in_tree
  end

  if nums.length == 0
    tree.set(nums, 0)
    return 0
  end

  if nums.length == 1
    tree.set(nums, nums[0])
    return nums[0]
  end

  if nums.length == 2
    coins = nums.max * (nums.min + 1)
    tree.set(nums, coins)
    return coins
  end

  max_coins = -1
  (0...nums.length).each do |i|
    this_coins = nums[i]
    this_coins *= nums[i-1] if i > 0
    this_coins *= nums[i+1] if i < nums.length - 1

    max_coins = [max_coins, this_coins + max_coin_of_nums(tree, nums[0...i] + nums[i+1...nums.length])].max
  end

  tree.set(nums, max_coins)
  return max_coins
end

class Tree
  def initialize()
    @root = Node.new(0)
  end

  def get(nums)
    n = @root
    nums.each do |num|
      if n.children.has_key?(num)
        n = n.children[num]
      else
        return nil
      end
    end
    return n.val
  end

  def set(nums, val)
    prev = @root
    n = nil
    nums.each do |num|
      if !prev.children.has_key?(num)
        n = Node.new(nil)
        prev.children[num] = n
      else
        n = prev.children[num]
      end
      prev = n
    end

    prev.val = val
  end
end

class Node
  attr_accessor :val, :children

  def initialize(val)
    @children = {}
    @val = val
  end
end
