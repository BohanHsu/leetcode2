# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
  stack = []
  chars = s.chars
  chars.each_with_index do |char, idx|
    if char == '('
      stack << idx
    elsif char == ')'
      if !stack.empty? && chars[stack.last] == '('
        stack.pop
      else
        stack << idx
      end
    end
  end

  count_prefix_remove = 0
  prefix = {}
  middle_begin = -1
  if !stack.empty? && s[stack.first] == ')'
    prefix[s[0...(stack.first)]] = true
  else
    middle_begin = 0
  end
  while !stack.empty? && s[stack.first] == ')' do
    new_prefix = {}
    prefix.keys.each do |pref|
      new_pref = pref + s[(pref.length+count_prefix_remove)..stack.first]
      new_pref.length.times do |i|
        if new_pref[i] == ')' && could_move(s, i)
          deleted_new_pref = String.new(new_pref)
          deleted_new_pref.slice!(i)
          new_prefix[deleted_new_pref] = true
        end
      end
    end

    middle_begin = stack.shift + 1
    prefix = new_prefix
    count_prefix_remove += 1
  end

  count_suffix_remove = 0
  suffix = {}
  middle_end = -1
  if !stack.empty? && s[stack.last] == '('
    suffix[s[stack.last+1...chars.length]] = true
  else
    middle_end = chars.length - 1
  end

  while !stack.empty? && s[stack.last] == "(" do
    new_suffix = {}
    suffix.keys.each do |suff|
      new_suff = s[stack.last...(chars.length - suff.length) - count_suffix_remove] + suff
      new_suff.length.times do |i|
        if new_suff[i] == '(' && could_move(chars, (chars.length - suff.length + i))
          deleted_new_suff = String.new(new_suff)
          deleted_new_suff.slice!(i)
          new_suffix[deleted_new_suff] = true
        end
      end
    end

    middle_end = stack.pop - 1
    suffix = new_suffix
    count_suffix_remove += 1
  end

  middle = ""
  if middle_begin <= middle_end
    middle = s[middle_begin..middle_end]
  end

  result = {}
  if prefix.keys.empty? || suffix.keys.empty?
    if prefix.keys.empty? && suffix.keys.empty?
      return [middle]
    elsif prefix.keys.empty?
      suffix.keys.each do |suff|
        result[middle + suff] = true
      end
    elsif suffix.keys.empty?
      prefix.keys.each do |pref|
        result[pref + middle] = true
      end
    end
  else
    prefix.keys.each do |pref|
      suffix.keys.each do |suff|
        result[pref + middle + suff] = true
      end
    end
  end

  result.keys
end

def could_move(chars, i)
  true
end
