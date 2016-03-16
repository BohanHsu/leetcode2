# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  return "" if s == ""
  
  chars = s.chars
  hsh = {}

  chars.each do |char|
    hsh[char] = true
  end

  count = hsh.size

  ic = find_min_after_index(0, chars, {})
  arr = [ic, {chars[ic] => true}, [ic]]

  while arr[2].length <= count do
    from = arr[0]
    selected_chars = arr[1]
    seq = arr[2]

    if seq.length == count
      return seq.map do |idx|
        chars[idx]
      end.join("")
    end

    new_ic = find_min_after_index(from + 1, chars, selected_chars)
    while new_ic == -1 do
      failed_last = seq.pop
      selected_chars.delete(chars[failed_last])
      new_from = seq.last

      if new_from.nil?
        new_ic = find_min_after_index(0, chars, {}, chars[failed_last])
      else
        new_ic = find_min_after_index(new_from + 1, chars, selected_chars, chars[failed_last])
      end
    end

    new_selected_chars = selected_chars.clone
    new_selected_chars[chars[new_ic]] = true
    arr = [new_ic, new_selected_chars, arr[2] + [new_ic]]
  end
  nil
end

def find_min_after_index(from, chars, selected_chars, low_boundry=nil)
  min_val = nil
  min_idx = -1

  (from...chars.length).each do |i|
    if !selected_chars.has_key?(chars[i])
      if low_boundry.nil? || chars[i] > low_boundry
        if min_val.nil?
          min_val = chars[i]
          min_idx = i
        end
        if chars[i] < min_val
          min_val = chars[i]
          min_idx = i
        end
      end
    end
  end

  min_idx
end
