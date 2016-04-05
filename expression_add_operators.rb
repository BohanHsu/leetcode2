# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
  results = []
  stack = []

  (0...num.length).each do |i|
    val_str = num[0..i]
    val = val_str.to_i
    if val.to_s == val_str
      stack << [i, val_str, val, val]
    end
  end

  while !stack.empty? do
    last_idx, expr, expr_val, last_number = stack.pop

    if last_idx + 1 == num.length && expr_val == target
      results << expr
    else
      (last_idx+1...num.length).each do |i|
        val_str = num[last_idx+1..i]
        val = val_str.to_i
        if val.to_s == val_str
          stack << [i, expr + '+' + val_str, expr_val + val, val]
          stack << [i, expr + '-' + val_str, expr_val - val, -val]
          stack << [i, expr + '*' + val_str, expr_val + (val - 1) * last_number, last_number * val]
        end
      end
    end
  end

  results
end
