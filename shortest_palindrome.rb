# @param {String} s
# @return {String}
def shortest_palindrome(s)
  array = s.chars
  from = 0
  to = array.length

  return "" if array.empty?
  return shortest_palindrome_helper(array, from, to).join("")
end

def shortest_palindrome_helper(array, from, to)
  i = first_index_of_pivot_by_range(array, from, to)
  match_result = match?(array, from, i)
  #puts "array=#{array}, from=#{from}, to=#{to}, i=#{i}, match_result=#{match_result}"
  if match_result.nil?
    #puts "shabi"
    j = i - 1
    while j >= from do
      match_result_j = match?(array, from, j)
      break if !match_result_j.nil?
      j -= 1
    end
    #puts "j=#{j}, match_result_j=#{match_result_j}"

    if match_result_j.length == 1
      j_piovt_array = array[(2*j - from + 1)...to].reverse + array[from...to]
    elsif match_result_j.length == 2
      j_piovt_array = array[(2*j - from)...to].reverse + array[from...to]
    end

    i_pivot_array = array[i...to].reverse + shortest_palindrome_helper(array, from, i) + array[i...to]
    #puts "from=#{from}, to=#{to}, i_pivot_array=#{i_pivot_array}, j_piovt_array=#{j_piovt_array}"
    return i_pivot_array.length < j_piovt_array.length ? i_pivot_array : j_piovt_array
  elsif match_result.length == 1
    return array[(2 * i - from + 1)...to].reverse + array[from...to]
  elsif match_result.length == 2
    return array[(2 * i - from)...to].reverse + array[from...to]
  end
end

# @return [i] if i is pivot, [i-1, i] if pivot is bewteen i-1 & i, return nil if not match
def match?(array, from, i)
  j = i - 1
  while j >= from do
    k = 2 * i - j
    if array[j] != array[k]
      break
    end
    j -= 1
  end

  return [i] if j < from

  j = i - 1
  while j >= from do
    k = 2 * i - j - 1
    if array[j] != array[k]
      break
    end
    j -= 1
  end

  return j < from ? [i-1, i] : nil
end

def first_index_of_pivot_by_range(array, from, to)
  hsh_l = {}
  hsh_r = {}

  (from...to).each do |i|
    if !hsh_r.has_key?(array[i])
      hsh_r[array[i]] = 0
    end
    hsh_r[array[i]] += 1
  end

  (from...to).each do |i|
    if hsh_r.has_key?(array[i])
      if hsh_r[array[i]] == 1
        hsh_r.delete(array[i])
      else
        hsh_r[array[i]] -= 1
      end
    end

    if !hsh_l.has_key?(array[i])
      hsh_l[array[i]] = 0
    end
    hsh_l[array[i]] += 1

    hsh_l.each do |k, v|
      if !hsh_r.has_key?(k) || hsh_r[k] < v
        return i
      end
    end
  end
  nil
end
