class MyQueue
  # Initialize your data structure here.
  def initialize
    @status = true
    @stack = []
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    if !@status
      reverse_stack
      @status = true
    end
    @stack << x
    nil
  end

  # @return {void}
  def pop
    if @status
      reverse_stack
      @status = false
    end
    @stack.pop
    nil
  end

  # @return {Integer}
  def peek
    if @status
      reverse_stack
      @status = false
    end
    if @stack.length == 0
      return nil
    end
    @stack.last
  end

  # @return {Boolean}
  def empty
    @stack.empty?
  end

  def reverse_stack
    new_stack = []
    while !@stack.empty? do
      new_stack << @stack.pop
    end
    @stack = new_stack
  end
end
