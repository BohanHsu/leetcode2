# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
  check_existence = {}
  result = []
  root = {}
  palindromes = {}
  words.each_with_index do |word, idx|
    insert_arr(root, word.chars, idx, :ltr)
    insert_arr(root, word.chars.reverse, idx, :rtl)
  end

  words.each_with_index do |word, idx|
    possible_match = search_in_tree(root, word.chars, :rtl)
    if !possible_match.nil?
      possible_match.keys.each do |j|
        if idx != j && is_palindrome(palindromes, words, j, 0, words[j].length-words[idx].length)
          add_result(result, check_existence, [idx, j])
        end
      end
    end

    possible_match = search_in_tree(root, word.chars.reverse, :ltr)
    if !possible_match.nil?
      possible_match.keys.each do |j|
        if idx != j && is_palindrome(palindromes, words, j, words[idx].length, words[j].length)
          add_result(result, check_existence, [j, idx])
        end
      end
    end
  end

  return result
end

def add_result(result, check_existence, pair)
  if !(check_existence.has_key?(pair[0]) && check_existence[pair[0]].has_key?(pair[1]))
    if !check_existence.has_key?(pair[0])
      check_existence[pair[0]] = {}
    end

    check_existence[pair[0]][pair[1]] = true
    result << pair
  end
end

# to: not include
def is_palindrome(palindromes, words, j, from, to)
  if palindromes.has_key?(j) && palindromes[j].has_key?(from) && palindromes[j][from].has_key?(to)
    return palindromes[j][from][to]
  end

  a = from
  b = to - 1

  result = true
  while a <= b do
    if words[j][a] != words[j][b]
      result = false
      break
    end

    a += 1
    b -= 1
  end

  if !palindromes.has_key?(j)
    palindromes[j] = {}
  end
  if !palindromes[j].has_key?(from)
    palindromes[j][from] = {}
  end

  palindromes[j][from][to] = result

  return result
end

#return search arr in root, return node's target_direction
def search_in_tree(root, arr, target_direction)
  n = root
  arr.each do |chr|
    n = n[chr]
  end

  return n[target_direction]
end

def insert_arr(root, arr, idx, direction)
  n = root
  if !root.has_key?(direction)
    root[direction] = {}
  end
  root[direction][idx] = nil

  arr.each do |chr|
    if !n.has_key?(chr)
      n[chr] = {}
    end
    if !n[chr].has_key?(direction)
      n[chr][direction] = {}
    end
    n[chr][direction][idx] = nil
    
    n = n[chr]
  end
end
