# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
  input = expr_to_array(input)
  if input.length == 0
    return []
  end
  if input.length == 1
    return [input[0].to_i]
  end
  num_of_operand = (input.length + 1) / 2
  expressions = {
    2 => ["(?#?)"]
  }

  current_num_of_operand = 2
  while current_num_of_operand < num_of_operand do
    current_num_of_operand += 1
    current_expressions = []
    (1...current_num_of_operand).each do |i|
      if i == 1 
        current_expressions += expressions[current_num_of_operand-1].map do |expression|
          "(?##{expression})"
        end
      elsif i == current_num_of_operand - 1
        current_expressions += expressions[current_num_of_operand-1].map do |expression|
          "(#{expression}#?)"
        end
      else
        expressions[i].each do |expr_i|
          expressions[current_num_of_operand-i].each do |expr_j|
            current_expressions << "(#{expr_i}##{expr_j})"
          end
        end
      end
    end
    expressions[current_num_of_operand] = current_expressions
  end

  return target_expressions = expressions[num_of_operand].map do |expr|
    eval(expression_pattern_to_expr(expr.split(//), input).join(""))
  end
end

def expression_pattern_to_expr(expression, input)
  i = 0
  j = 0
  while i < expression.length do
    if expression[i] == '?' || expression[i] == '#'
      expression[i] = input[j]
      j += 1
    end
    i += 1
  end
  expression
end

def expr_to_array(input)
  array = []
  input.chars.each do |chr|
    if is_num(chr) && !array.empty? && is_num(array[-1][-1])
      array[-1] += chr
    else
      array << chr
    end
  end
  return array
end

def is_num(chr)
  return chr.ord >= "0".ord && chr.ord <= "9".ord
end
