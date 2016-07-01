# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  hsh = {}
  word_dict.each do |word|
    hsh[word.length] = true
  end
  word_lengths = hsh.keys.sort.reverse
  #puts "word_lengths=#{word_lengths}"

  stack = []

  (0...word_lengths.length).each do |i|
    if word_lengths[i] <= s.length && word_dict.include?(s[0...word_lengths[i]])
      stack << [word_lengths[i] - 1, i]
      if word_lengths[i] == s.length
        return true
      else
        break
      end
    end
  end

  while !stack.empty? do
    #puts "stack=#{stack}"
    last_length, start = stack.last
    old_len = stack.length
    #puts "last_length=#{last_length}, start=#{start}"

    (0...word_lengths.length).each do |i|
      if last_length + word_lengths[i] <= s.length && word_dict.include?(s[(last_length+1)...(last_length+1+word_lengths[i])])
        stack << [word_lengths[i] + last_length, i]
        #puts "word_lengths[i] + last_length + 1=#{word_lengths[i] + last_length + 1}"
        if word_lengths[i] + last_length + 1 == s.length
          return true
        else
          break
        end
      end
    end

    while stack.length == old_len && !stack.empty? do
      start = stack.pop.last
      last_length = stack.empty? ? -1 : stack.last.first
      old_len = stack.length
      #puts "last_length=#{last_length}, start=#{start}"

      ((start+1)...word_lengths.length).each do |i|
        if last_length + 1 + word_lengths[i] <= s.length && word_dict.include?(s[(last_length+1)...(last_length+1+word_lengths[i])])
          #puts "i=#{i}"
          stack << [word_lengths[i] + last_length, i]
          if word_lengths[i] + last_length + 1 == s.length
            return true
          else
            break
          end
        end
      end
    end
  end
  false
end
