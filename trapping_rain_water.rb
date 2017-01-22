# @param {Integer[]} height
# @return {Integer}
#def trap(height)
#  return my_trap(height)
#end

def my_trap(height)
  picks = find_picks(height)
  pairs = pair_picks(height, picks)
  sum = 0

  pairs.each do |p|
    from, to = p
    min_height = [height[from], height[to]].min
    (from+1...to).each do |i|
      if height[i] <= min_height
        sum += (min_height - height[i])
      end

    end
  end

  return sum
end

# @return {Integer} array of pick indices
def find_picks(heights)
  if heights.length == 0
    return []
  end
  if heights.length == 1
    return [0]
  end

  arr = []
  heights.each_with_index do |h, i|
    if i == 0 && h >= heights[i+1]
      arr << i
    elsif i == heights.length - 1 && h >= heights[i-1]
      arr << i
    elsif h >= heights[i-1] && h >= heights[i+1]
      arr << i
    end
  end

  return arr
end

def pair_picks(height, picks)
  pairs = []
  stack = []

  picks.each do |p|
    last_pop = nil
    while !stack.empty? && height[stack[-1]] <= height[p] do
      last_pop = stack.pop
    end

    if stack.empty? 
      if !last_pop.nil?
        pairs << [last_pop, p]
      end
    end

    stack << p
  end

  stack.each_with_index do |e, i|
    if i != stack.length - 1
      pairs << [e, stack[i+1]]
    end
  end
  return pairs
end
