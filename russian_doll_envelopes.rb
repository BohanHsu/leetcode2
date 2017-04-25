# @param {Integer[][]} envelopes
# @return {Integer}
def max_envelopes(envelopes)
  result = 0
  envelopes.sort! do |a, b|
    if a[0] < b[0]
      res = -1
    elsif a[0] > b[0]
      res = 1
    else
      if a[1] < b[1]
        res = -1
      elsif a[1] > b[1]
         res = 1
      else
        res = 0
      end
    end

    res
  end

  depth = envelopes.map do
    1
  end

  envelopes.each_with_index do |e1, i|
    envelopes.each_with_index do |e2, j|
      if j >= i
        break
      end

      if e1[0] > e2[0] && e1[1] > e2[1]
        if depth[i] < depth[j] + 1
          depth[i] = depth[j] + 1
        end
      end
    end
    result = [result, depth[i]].max
  end

  return result
end
