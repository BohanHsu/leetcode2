class MedianFinder
  # @param {integer} word
  # @return {void}
  # Adds a num into the data structure.
  def add_num(num)

  end

  # @return {double}
  # Returns median of current data stream
  def find_median()

  end
end

# Your MedianFinder object will be instantiated and called as such:
# mf = MedianFinder.new
# mf.add_num(1)
# mf.find_median()

class PriorityQueue

  module Priority
    MAX_HEAP = 1
    MIN_HEAP = 2
  end

  class Node
    attr_accessor :val, :parent, :l_child, :r_child, :l_sibling, :r_sibling, :size
    def initialize(val)
      @val = val
      @parent, @l_child, @r_child, @l_sibling, @r_sibling = nil, nil, nil, nil, nil
    end
  end

  def initialize(priority)
    @priority = priority
    @root = nil
    @last = nil
    @size = 0
  end

  def add(val)
    @size += 1
    n = Node.new(val)
    if @last.nil?
      @root = n
      @last = @root
    elsif @last.parent.nil?
      @last = n
      @last = root.l_child
      @last.parent = @root
    elsif @last == @last.parent.l_child
      n.parent = @last.parent
      n.parent.r_child = n
      n.l_sibling = @last
      @last.r_sibling = n
      @last = n
    elsif !@last.parent.r_sibling.nil?
      @last.parent.r_sibling.l_child = n
      n.parent = @last.parent.r_sibling
      n.l_sibling = @last
      @last.r_sibling = n
      @last = n
    else
      p = @last
      while !p.l_sibling.nil? do
        p = p.l_sibling
      end
      p.l_child = n
      n.parent = p
    end
    add_shift(n)
    val
  end

  def add_shift(node)
    while should_add_shift(n) do
      tmp = n.val
      n.val = n.parent.val
      n.parent.val = tmp
      n = n.parent
    end
    nil
  end

  def should_add_shift(node)
    return false if node.parent.nil?
    if @priority == Priority::MAX_HEAP
      return node.val > node.parent.val
    elsif @priority == Priority::MIN_HEAP
      return node.val < node.parent.val
    end
    return false
  end

  def remove()
    @size -= 1
    root_val = @root.val
    last_val = @last.val
    if @last == @root
      @root = nil
      @last = nil
    else
      if !@last.l_sibling.nil?
        if @last == @last.parent.l_child
          @last.parent.l_child = nil
        else
          @last.parent.r_child = nil
        end

        @last = @last.l_sibling
        @last.r_sibling = nil
      else
        @last = @last.parent
        @last.l_child = nil
        while !@last.r_sibling.nil? do
          @last = @last.r_sibling
        end
      end
    end

    @root.val = last_val

    remove_shift()
  end

  def remove_shift()
  end

end
