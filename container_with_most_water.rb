# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  i = 0
  j = height.length - 1
  max_container = 0

  while i < j do
    max_container = [max_container, [height[i], height[j]].min * (j - i)].max
    if height[i] < height[j]
      i += 1
    else
      j -= 1
    end
  end

  max_container
end
