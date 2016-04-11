# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
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
    eval(expression_pattern_to_expr(expr, input))
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
