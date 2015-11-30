# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0
  i = 1

  while i < prices.length do
    profit += (prices[i] - prices[i-1]) if prices[i] > prices[i-1]
    i += 1
  end

  profit
end
