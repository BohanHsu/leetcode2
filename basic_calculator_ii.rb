# @param {String} s
# @return {Integer}
def calculate(s)
  s = s.chars.select do |chr|
    chr != ' '
  end.join("")

  arr = []
  s.chars.each do |chr|
    if arr.empty?
      arr << chr
    else
      if chr.ord <= "9".ord && chr.ord >= "0".ord
        if arr[-1].to_i.to_s == arr[-1]
          arr[-1] += chr
        else
          arr << chr
        end
      else
        arr << chr
      end
    end
  end

  output_queue = []
  operator_stack = []

  arr.each do |token|
    if token.to_i.to_s != token
      if token == "("
        operator_stack << token
      elsif token == ")"
        while operator_stack.last != "(" do
          output_queue << operator_stack.pop
        end
        operator_stack.pop
      else
        while !operator_stack.empty? && operator_stack.last != "(" && (get_lr(token) == :l && compare_token(token, operator_stack.last) <= 0 || get_lr(token) == :r && compare_token(token, operator_stack.last) < 0) do
          output_queue << operator_stack.pop
        end

        operator_stack << token
      end
    else
      output_queue << token
    end
  end

  while !operator_stack.empty? do
    output_queue << operator_stack.pop
  end

  stack = []
  output_queue.each do |token|
    if token.to_i.to_s != token
      oper2 = stack.pop.to_i
      oper1 = stack.pop.to_i
      if token == "+"
        tmp_res = oper1 + oper2
      elsif token == '-'
        tmp_res = oper1 - oper2
      elsif token == '*'
        tmp_res = oper1 * oper2
      elsif token == '/'
        tmp_res = oper1 / oper2
      elsif token == '^'
        tmp_res = oper1 ^ oper2
      end
      stack << tmp_res
    else
      stack << token
    end
  end
  if stack[0].class == String
    return stack[0].to_i
  end
  return stack[0]
end

def get_lr(token)
  if token == '^'
    return :r
  else
    return :l
  end
end

def compare_token(t1, t2)
  precedence = {
    '^' => 4,
    '*' => 3,
    '/' => 3,
    '+' => 2,
    '-' => 2
  }
  return precedence[t1] - precedence[t2]
end
