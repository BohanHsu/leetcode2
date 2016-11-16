# @param {String} str
# @return {Integer}
def my_atoi(str)
  is_positive = true
  first_num_show = false
  first_non_num_after_num_show = false
  first_sign_index = -1
  white_spaces = ["\n", "\t", " "]
  result = 0
  str.chars.each_with_index do |chr, i|
    if !first_num_show && white_spaces.include?(chr)
      next
    end

    if !first_num_show
      if chr == '+' || chr == '-'
        is_positive = chr != '-'
        first_sign_index = i
        first_num_show = true
      end
    end
    if chr.ord >= '0'.ord && chr.ord <= '9'.ord
      if first_non_num_after_num_show
        return is_positive ? result : -result
      end

      if !first_num_show
        first_num_show = true
      end
      result = result * 10 + chr.ord - '0'.ord
      if is_positive && result > 2147483647
        return 2147483647
      end
      if !is_positive && result > 2147483648
        return -2147483648
      end
    elsif i != first_sign_index
      if first_num_show
        first_non_num_after_num_show = true
      else
        return 0
      end
    end
  end

  return is_positive ? result : -result
end
