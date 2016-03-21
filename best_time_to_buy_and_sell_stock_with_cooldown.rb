# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  local = 0
  globals = [0]

  (1...prices.length).each do |i|
    local = [0, prices[i] - prices[i-1] + local].max
    if i >= 3
      local = [local, prices[i] - prices[i-1] + globals[0]].max
    end

    globals << [globals[-1], local].max
    while globals.length > 3
      globals.shift
    end

    #puts "i=#{i}, prices[i]=#{prices[i]}, local=#{local}, globals=#{globals}"
  end

  globals.last
end
