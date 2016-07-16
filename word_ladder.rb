# @param {String} begin_word
# @param {String} end_word
# @param {Set<String>} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  dist = {begin_word => 1}
  queue = [begin_word]

  while !queue.empty? do
    word = queue.shift
    neighbors = get_neighbors(word, word_list, end_word)
    neighbors.each do |new_word|
      if !dist.include?(new_word)
        queue << new_word
        dist[new_word] = dist[word] + 1

        if new_word == end_word
          return dist[end_word]
        end
      end
    end
  end
  return 0
end

def get_neighbors(word, word_list, end_word)
  result = []
  (0...word.length).each do |i|
    (('a'.ord)..('z'.ord)).each do |order|
      new_word = String.new(word)
      new_word[i] = order.chr
      if (word_list.include?(new_word) && new_word != word) || new_word == end_word
        result << new_word
      end
    end
  end
  result
end
