class WordDictionary

  def initialize
    @root = Node.new
  end

  # @param {string} word
  # @return {void}
  # Adds a word into the data structure.
  def add_word(word)
    n = @root
    word.chars.each do |chr|
      if n.children.has_key?(chr)
        n = n.children[chr]
      else
        new_n = Node.new
        n.children[chr] = new_n
        n = new_n
      end
    end
    n.is_word = true
    nil
  end

  # @param {string} word
  # @return {boolean}
  # Returns if the word is in the data structure. A word could
  # contain the dot character '.' to represent any one letter.
  def search(word)
    queue = [[@root, word.chars]]

    while !queue.empty? do
      node, chars = queue.shift
      while !chars.empty? do
        if chars[0] == '.'
          new_chars = chars[1...chars.length]
          node.children.values.each do |new_node|
            queue << [new_node, Array.new(new_chars)]
          end
          break
        elsif node.children.has_key?(chars[0])
          chr = chars.shift
          node = node.children[chr]
        else
          node = nil
          break
        end
      end
      return true if chars.empty? && !node.nil? && node.is_word
    end
    false
  end

  class Node
    attr_accessor :children, :is_word
    def initialize
      @children = {}
      @is_word = false
    end

    def to_s
      "childred=#{@children}, is_word=#{@is_word}"
    end
  end
end

# Your WordDictionary object will be instantiated and called as such:
# word_dictionary = WordDictionary.new
# word_dictionary.add_word("word")
# word_dictionary.search("pattern")
