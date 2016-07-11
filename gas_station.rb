# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  diffs = gas.map {|g| 0}
  gas.each_with_index do |g, i|
    diffs[i] = g - cost[i]
  end
  #puts "gas=#{gas}, cost=#{cost}, diffs=#{diffs}"

  start_index = -1
  sum = 0

  k = 0

  while k < diffs.length && diffs[k] <= 0 do
    k += 1
  end

  if k == diffs.length
    return diffs.inject(0) {|memo, obj| memo + obj} == 0 ? 0 : -1
  end

  j = 0
  while j < diffs.length do
    i = (k + j) % diffs.length
    sum += diffs[i]
    #puts "i=#{i}, j=#{j}, k=#{k}, sum=#{sum}"

    if sum < 0
      if k + j >= diffs.length
        return -1
      else
        k = i + 1
        while k < diffs.length && diffs[k] <= 0
          k += 1
        end
        if k == diffs.length
          return -1
        end
        j = -1
        sum = 0
      end
    end
    j += 1
  end

  #start_index
  k
end
