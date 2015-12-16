# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  return 0 if k == 0

  if k > prices.length / 2
    sum = 0
    i = 1

    while i < prices.length do
      diff = (prices[i] - prices[i-1])
      sum += diff > 0 ? diff : 0
      i += 1
    end

    return sum
  end

  locals = []
  globals = []

  min_price = prices[0]
  locals[0] = []
  locals[1] = []
  locals[1] << 0
  globals[0] = []
  globals[1] = []
  globals[1] << 0

  (1...prices.length).each do |i|
    locals[1] << prices[i] - min_price
    min_price = prices[i] if prices[i] < min_price
    globals[1] << [globals[1][i-1], locals[1][i]].max
  end

  #p "j=0"
  #p "locals=#{locals}"
  #p "globals = #{globals}"

  j = 1
  while j < k do
    locals[0] = locals[1]
    locals[1] = (j * 2 + 1).times.map do
      0
    end

    globals[0] = globals[1].map do |i|
      i
    end

    ((j * 2 + 1)...prices.length).each do |i|
      locals[1] << [
        globals[0][i - 2] + prices[i] - prices[i-1],
        locals[1][i-1] + prices[i] - prices[i-1]
      ].max
      globals[1][i] = [locals[1][i], globals[1][i-1], globals[1][i]].max
    end
    #p "j=#{j}"
    #p "locals=#{locals}"
    #p "globals = #{globals}"

    j += 1
  end

  globals[1].last || 0
end
