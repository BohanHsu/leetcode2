# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
  preorder = preorder.split(/,/)

  return true if preorder.length == 0
  if preorder.first == '#'
    return preorder.length == 1
  end
  stack = []

  preorder[(0...preorder.length)].each_with_index do |elem, idx|
    if elem == '#'
      stack[-1] += 1
      while stack.last == 2
        stack.pop

        if stack.empty?
          return idx == preorder.length - 1
        end

        stack[-1] += 1
      end
    else
      stack << 0
    end
  end
  return stack.empty?
end
