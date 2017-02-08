# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
  # @param {NestedInteger[]} nested_list
  def initialize(nested_list)
    @stack = []
    @stack << [nested_list, 0]
  end

  # @return {Boolean}
  def has_next
    return false if @stack.empty?

    k = @stack.length - 1
    while k >= 0 do
      go_down = false
      j = 1

      if i >= list.length
        if k == 0
          return false
        end
        k -= 1
        go_down = true
      end

      if !go_down
        nl = list[i]
        return true if nl.is_integer
        local_stack = []

        while !go_down && !nl.is_integer do
          local_stack << [nl.get_list, 0]
          while !local_stack.empty? && local_stack.last[0].length <= local_stack.last[1] do
            local_stack.pop
          end
          if !local_stack.empty?
            nl = local_stack.last[0][local_stack.last[1]]
            local_stack.last[1] += 1
          else
            if i + j < list.length
              nl = list[i+j]
              j += 1
            else
              return false if k == 0
              k -= 1
              go_down = true
            end
          end
        end

        if !go_down && nl.is_integer
          return true
        end
      end
    end

    return true
  end

  # @return {Integer}
  def next
    result = nil
    while @stack.last[0].length <= @stack.last[1]
      @stack.pop
    end
    list, i = @stack.last
    nl = list[i]
    if nl.is_integer
      result = nl.get_integer

      @stack.last[1] += 1

      while !@stack.empty? && @stack.last[1] >= @stack.last[0].length do
        @stack.pop
      end
    else
      @stack.last[1] += 1

      while !nl.is_integer do
        @stack << [nl.get_list, 0]
        while @stack.last[0].length <= @stack.last[1]
          @stack.pop
        end
        nl = @stack.last[0][@stack.last[1]]
        @stack.last[1] += 1
      end
      result = nl.get_integer
    end

    return result
  end

  def next_idx

  end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end
