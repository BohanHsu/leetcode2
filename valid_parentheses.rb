# @param {String} s
# @return {Boolean}
def is_valid(s)
  open = {}
  ["[", "{", "("].each do |chr|
    open[chr] = true
  end
  close = {
    "]" => "[",
    "}" => "{",
    ")" => "("
  }

  stack = []

  s.chars.each do |chr|
    if open.has_key?(chr)
      stack << chr
    elsif !close.has_key?(chr) || stack.empty? || stack.last != close[chr]
      return false
    else
      stack.pop
    end
  end

  return stack.empty?
end
