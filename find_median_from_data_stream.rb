class MedianFinder

  def initialize
    @l_heap = PriorityQueue.new(PriorityQueue::Priority::MAX_HEAP)
    @l_hash = {}
    @l_count = 0

    @r_heap = PriorityQueue.new(PriorityQueue::Priority::MIN_HEAP)
    @r_hash = {}
    @r_count = 0
  end

  # @param {integer} word
  # @return {void}
  # Adds a num into the data structure.
  def add_num(num)
    if @l_hash.has_key?(num)
      add_one_to_hash(@l_hash, num)
      @l_count += 1
      balance_hash
    elsif @r_hash.has_key?(num)
      add_one_to_hash(@r_hash, num)
      @r_count += 1
      balance_hash
    else
      if !@r_heap.peek.nil? && num >= @r_heap.peek
        @r_heap.add(num)
        add_one_to_hash(@r_hash, num)
        @r_count += 1
        balance_hash
      else
        @l_heap.add(num)
        add_one_to_hash(@l_hash, num)
        @l_count += 1
        balance_hash
      end
    end
  end

  # @return {double}
  # Returns median of current data stream
  def find_median()
    return nil if @l_count == 0 && @r_count == 0
    if @l_count == @r_count
      return (@l_heap.peek + @r_heap.peek) / 2.0
    elsif @l_count == @r_count + 1
      return @l_heap.peek
    else
      return @r_heap.peek
    end
  end

  def add_one_to_hash(hsh, num)
    if !hsh.has_key?(num)
      hsh[num] = 0
    end
    hsh[num] += 1
  end

  def delete_one_from_hash(hsh, num)
    hsh[num] -= 1
    if hsh[num] == 0
      hsh.delete(num)
    end
  end

  def balance_hash
    while @l_count > @r_count + 1 do
      num = @l_heap.peek
      delete_one_from_hash(@l_hash, num)
      if !@l_hash.has_key?(num)
        @l_heap.remove
      end
      @l_count -= 1

      if !@r_hash.has_key?(num)
        @r_heap.add(num)
      end
      add_one_to_hash(@r_hash, num)
      @r_count += 1
    end

    while @r_count > @l_count + 1 do
      num = @r_heap.peek
      delete_one_from_hash(@r_hash, num)
      if !@r_hash.has_key?(num)
        @r_heap.remove
      end
      @r_count -= 1

      if !@l_hash.has_key?(num)
        @l_heap.add(num)
      end
      add_one_to_hash(@l_hash, num)
      @l_count += 1
    end
  end
end

# Your MedianFinder object will be instantiated and called as such:
# mf = MedianFinder.new
# mf.add_num(1)
# mf.find_median()

class PriorityQueue
  attr_accessor :size

  module Priority
    MAX_HEAP = 1
    MIN_HEAP = 2
  end

  class Node
    attr_accessor :val, :parent, :l_child, :r_child, :l_sibling, :r_sibling
    def initialize(val)
      @val = val
      @parent, @l_child, @r_child, @l_sibling, @r_sibling = nil, nil, nil, nil, nil
    end
  end

  def to_s
    return [].to_s if @root.nil?
    res = []
    queue = [@root]
    while !queue.empty? do
      n = queue.shift
      res << n.val
      if !n.l_child.nil?
        queue << n.l_child
      end

      if !n.r_child.nil?
        queue << n.r_child
      end
    end
    res.to_s
  end

  def initialize(priority)
    @priority = priority
    @root = nil
    @last = nil
    @size = 0
  end

  def peek
    return nil if @root.nil?
    return @root.val
  end

  def add(val)
    @size += 1
    n = Node.new(val)
    if @last.nil?
      @root = n
      @last = @root
    elsif @last.parent.nil?
      @last = n
      @root.l_child = @last
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
      @last = n
    end
    add_shift(n)
    val
  end

  def add_shift(n)
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

  def remove
    if @root.nil?
      return nil
    end
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

    if !@root.nil?
      @root.val = last_val
      remove_shift
    end
    root_val
  end

  def remove_shift
    node = @root
    shift_node = which_shift(node)

    while !shift_node.nil? do
      tmp = node.val
      node.val = shift_node.val
      shift_node.val = tmp

      node = shift_node
      shift_node = which_shift(node)
    end
  end

  def which_shift(node)
    if @priority == Priority::MAX_HEAP
      if (!node.l_child.nil? && node.val < node.l_child.val) || (!node.r_child.nil? && node.val < node.r_child.val)
        if node.l_child.nil?
          return node.r_child
        elsif node.r_child.nil?
          return node.l_child
        else
          return node.l_child.val > node.r_child.val ? node.l_child : node.r_child
        end
      end
    elsif @priority == Priority::MIN_HEAP
      if (!node.l_child.nil? && node.val > node.l_child.val) || (!node.r_child.nil? && node.val > node.r_child.val)
        if node.l_child.nil?
          return node.r_child
        elsif node.r_child.nil?
          return node.l_child
        else
          return node.l_child.val < node.r_child.val ? node.l_child : node.r_child
        end
      end
    end
    return nil
  end
end
