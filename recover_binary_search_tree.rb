# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def to_s
    "@val=#{@val}"
  end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  @buffer = []
  #@fst = nil
  @snd = nil
  #@res = []
  @swaps = []

  def visit(n)
    puts "n=#{n.val}"
    if @buffer.length == 3
      @buffer.shift
    end
    @buffer << n

    if @buffer.length == 2
      if @buffer[0].val > @buffer[1].val
        #@fst = @buffer[0]
        @swaps << @buffer[0]
      end
    end

    if @buffer.length == 3
      if @buffer[0].val > @buffer[1].val && @buffer[1].val < @buffer[2].val
        #@fst = @buffer[1]
        @swaps << @buffer[1]
      end

      if @buffer[0].val < @buffer[1].val && @buffer[1].val > @buffer[2].val
        #@snd = @buffer[1]
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

  if @buffer[-1].val < @buffer[-2].val
    #@snd = @buffer[-1]
    @swaps << @buffer[-1]
    #puts "hahaha"
  end

  #puts "@buffer=#{@buffer.map {|n| n.val}}, @swaps=#{@swaps.map {|n| n.val}}"

  @fst = @swaps[0]
  @snd = @swaps[1]

  #puts "@buffer=#{@buffer.map {|n| n.val}}, @fst=#{@fst}, @snd=#{@snd}"

  tmp = @fst.val
  @fst.val = @snd.val
  @snd.val = tmp

  nil
end


## @param {TreeNode} root
## @return {Void} Do not return anything, modify root in-place instead.
#def recover_tree(root)
#  return if root.nil?
#  wrong_low = nil
#  wrong_high = nil
#
#  stack = [[root, -Float::INFINITY, Float::INFINITY]]
#
#  while !stack.empty? do
#    n, low_boundry, high_boundry = stack.pop
#    puts "n=#{n.val}, low_boundry=#{[low_boundry, n.left.nil? ? -Float::INFINITY : n.left.val].max}, high_boundry=#{[high_boundry, n.right.nil? ? Float::INFINITY : n.right.val].min}"
#
#    #if low_boundry <= high_boundry
#    if [low_boundry, n.left.nil? ? -Float::INFINITY : n.left.val].max <= [high_boundry, n.right.nil? ? Float::INFINITY : n.right.val].min
#      if n.val < low_boundry || !n.left.nil? && n.left.val > n.val
#        wrong_low = n
#        puts "  wrong_low.val=#{wrong_low.nil? ? "nil" : wrong_low.val}"
#      end
#
#      if n.val > high_boundry || !n.right.nil? && n.right.val < n.val
#        wrong_high = n
#        puts "  wrong_high.val=#{wrong_high.nil? ? "nil" : wrong_high.val}"
#      end
#    end
#
#    if !n.left.nil?
#      stack << [n.left, low_boundry, n.val]
#    end
#
#    if !n.right.nil?
#      stack << [n.right, n.val, high_boundry]
#    end
#  end
#
#  puts "====="
#  puts "wrong_low.val=#{wrong_low.nil? ? "nil" : wrong_low.val}"
#  puts "wrong_high.val=#{wrong_high.nil? ? "nil" : wrong_high.val}"
#
#  if wrong_low.nil?
#    wrong_low = root
#  end
#
#  if wrong_high.nil?
#    wrong_high = root
#  end
#
#  tmp = wrong_low.val
#  wrong_low.val = wrong_high.val
#  wrong_high.val = tmp
#
#  nil
#end
