# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  if words.empty?
    return (0...s.length).each.map {|i| i}
  end

  word_size = words.length
  word = {}
  words.each do |w|
    hash_add(word, w)
  end

  length = words[0].length

  result = length.times.map do |i|
    find_substring_helper(s[i...s.length], word, length, word_size).map do |j|
      j + i
    end
  end.inject([]) do |memo, obj|
    memo + obj
  end

  return result
end

# @word: {}
def find_substring_helper(s, word, length, word_size)
  res = []
  hsh = word.clone
  i = 0
  j = 0
  while i < s.length do

    if i - 1 + hsh.size * length >= s.length
      return res
    end

    str = s[i...(i+length)]
    if hsh.has_key?(str)
      hash_remove(hsh, str)

      if hsh.empty?
        res << j
        i += length
        j += length

        while i+length <= s.length && s[i...i+length] == s[j-length...j] do
          res << j
          i += length
          j += length
        end

        if i + length <= s.length && word.has_key?(s[i...i+length])
          while s[j-length...j] != s[i...i+length] do
            hash_add(hsh, s[j-length...j])
            j += length
          end
          hash_add(hsh, s[j-length...j])
        else
          hsh = word.clone
          j = i
        end
      else
        i += length
      end
    else
      if word.has_key?(str)
        while s[j...j+length] != str do
          hash_add(hsh, s[j...j+length])
          j += length
        end
        hash_add(hsh, s[j...j+length])
        j += length
      else
        hsh = word.clone
        i += length
        j = i
      end
    end
  end

  return res
end

def hash_add(hsh, ele)
  if !hsh.has_key?(ele)
    hsh[ele] = 1
  else
    hsh[ele] += 1
  end
end

def hash_remove(hsh, ele)
  hsh[ele] -= 1
  if hsh[ele] == 0
    hsh.delete(ele)
  end
end
