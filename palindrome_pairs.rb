# @param {String[]} words
# @return {Integer[][]}

def palindrome_pairs(words)
  check_existence = {}
  result = []
  palindromes = {}
  map = {}
  word_length = {}

  words.each_with_index do |word, i|
    map[word] = i
    word_length[word.length] = true
  end

  words.each_with_index do |word, i|
    if is_palindrome(palindromes, words, i, 0, words[i].length)
      if map.has_key?("")
        add_result(result, check_existence, [i, map[""]])
        add_result(result, check_existence, [map[""] ,i])
      end
    end

    word_length.keys.each do |j|
      if j > word.length
        next
      end
      k = word.length - j
      if is_palindrome(palindromes, words, i, 0, k)
        # left is palindrome
        reverse_right = word[k...word.length].reverse
        if map.has_key?(reverse_right)
          add_result(result, check_existence, [map[reverse_right], i])
        end
      end

      if is_palindrome(palindromes, words, i, j, word.length)
        # right is palindrome
        reverse_left = word[0...j].reverse
        if map.has_key?(reverse_left)
          add_result(result, check_existence, [i, map[reverse_left]])
        end
      end
    end
  end

  return result
end

def add_result(result, check_existence, pair)
  return if pair[0] == pair[1]
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
