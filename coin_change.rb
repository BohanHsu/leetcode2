# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  num_of_coins = (amount + 1).times.map do
    nil
  end
  num_of_coins[0] = 0

  (0..amount).each do |i|
    if !num_of_coins[i].nil?
      coins.each do |coin_val|
        if i + coin_val <= amount
          if num_of_coins[i+coin_val].nil?
            num_of_coins[i+coin_val] = num_of_coins[i] + 1
          else
            num_of_coins[i+coin_val] = [num_of_coins[i] + 1, num_of_coins[i+coin_val]].min
          end
        end
      end
    end
  end

  if num_of_coins[amount].nil?
    return -1
  end
  return num_of_coins[amount]
end
