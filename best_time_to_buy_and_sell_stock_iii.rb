# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  locals = 2.times.map do
    prices.map do
      0
    end
  end
  locals[0][0] = 0

  globals = 2.times.map do
    prices.map do
      0
    end
  end
  globals[0][0] = 0

  min = prices[0]
  i = 1
  while i < prices.length do
    locals[0][i] = profit(prices[i] - min)
    min = prices[i] if prices[i] < min
    globals[0][i] = [globals[0][i-1], locals[0][i]].max
    i += 1
  end

  i = 3
  globals[1] = globals[0].map {|i| i}
  while i < prices.length do
    locals[1][i] = (prices[i] - prices[i-1]) + [globals[0][i-2], locals[1][i-1]].max
    globals[1][i] = [locals[1][i], globals[1][i-1], globals[0][i]].max
    i += 1
  end

  globals[1].last || 0
end

def profit(num)
  num > 0 ? num : 0
end
