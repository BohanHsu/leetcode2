# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  tokens.each do |token|
    if token.to_i.to_s == token
      stack << token.to_i
    else
      return nil if stack.length < 2
      o2 = stack.pop
      o1 = stack.pop
      case
      when token == '+'
        stack << (o1 + o2)
      when token == '-'
        stack << (o1 - o2)
      when token == '*'
        stack << (o1 * o2)
      when token == '/'
        sign = true
        if o1 < 0
          sign = !sign
          o1 = -o1
        end

        if o2 < 0
          sign = !sign
          o2 = -o2
        end

        if sign
          stack << (o1 / o2)
        else
          stack << -(o1 / o2)
        end
      end
    end
    #puts "token=#{token}, stack=#{stack}"
  end
  return stack[0] if stack.length == 1
  return nil
end
