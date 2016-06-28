class LRUCache
  attr_accessor :top, :btm
  # Initialize your data structure here
  # @param {Integer} capacity
  def initialize(capacity)
    @capacity = capacity
    @size = 0
    @top = Node.new(nil, nil)
    @btm = Node.new(nil, nil)
    @top.later = @btm
    @btm.newer = @top
    @hsh = {}
  end

  # @param {Integer} key
  # @return {Integer}
  def get(key)
    return -1 if @capacity == 0
    return -1 if !@hsh.has_key?(key)

    value = @hsh[key].val
    set_node_to_top(@hsh[key])

    return value
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return {Void}
  def set(key, value)
    return if @capacity == 0

    if !@hsh.has_key?(key)
      if @size == @capacity
        @hsh.delete(pop_lru.key)
        @size -= 1
      end
      @size += 1
      node = Node.new(key, value)
      insert_node_at_top(node)
      @hsh[key] = node
    else
      node = @hsh[key]
      set_node_to_top(node)
      node.val = value
    end
  end

  def insert_node_at_top(node)
    node.later = @top.later
    node.later.newer = node
    @top.later = node
    node.newer = @top
  end

  def pop_lru
    tmp = @btm.newer
    node = @btm.newer.newer
    @btm.newer = node
    node.later = @btm
    tmp.later = nil
    tmp.newer = nil
    return tmp
  end

  def set_node_to_top(node)
    node.later.newer = node.newer
    node.newer.later = node.later

    node.later = @top.later
    @top.later.newer = node
    node.newer = @top
    @top.later = node
  end

  class Node
    attr_accessor :newer, :later, :key, :val
    def initialize(key, val)
      @key = key
      @val = val
      @newer = nil
      @later = nil
    end
    
    def to_s
      "[#{key}, #{val}]"
    end
  end

  def show_stack()
    res = []
    n = @top.later
    while !n.nil? do
      res << [n.key, n.val]
      n = n.later
    end
    return res[0...res.length-1]
  end

  def reverse_stack()
    res = []
    n = @btm.newer
    while !n.nil? do
      res << [n.key, n.val]
      n = n.newer
    end
    return res[0...res.length-1]
  end
end
