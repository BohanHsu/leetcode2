class Stack
  # Initialize your data structure here.
  def initialize
    @queue = []
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    @queue << x
  end

  # @return {void}
  def pop
    new_queue = []
    while @queue.length > 1 do
      new_queue << @queue.shift
    end
    result = @queue.shift
    @queue = new_queue
    result
  end

  # @return {Integer}
  def top
    @queue.last
  end

  # @return {Boolean}
  def empty
    @queue.empty?
  end
end
