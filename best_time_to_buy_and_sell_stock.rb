# @param {Integer[]} prices
# # @return {Integer}
def max_profit(prices)
  min = prices.first
  max_profit = 0
  i = 1
  while i < prices.length do
    min = prices[i] if prices[i] < min
    max_profit = (prices[i] - min) if prices[i] - min > max_profit
    i += 1
  end
  max_profit
end
