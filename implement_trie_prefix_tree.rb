class TrieNode
  # Initialize your data structure here.
  def initialize
    @children = {}
    @is_word
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  # @param {string} word
  # @return {void}
  # Inserts a word into the trie.
  def insert(word)
    node = @root
    word.chars.each do |chr|
      if !node.has_key?(chr)
        node[chr] = TrieNode.new
      end
      node = node[chr]
    end
    node.is_word = true
  end

  # @param {string} word
  # @return {boolean}
  # Returns if the word is in the trie.
  def search(word)
    node = search_helper(word)
    !node.nil? && node.is_word
  end

  def search_helper(word)
    node = @root
    word.chars.each do |chr|
      return nil if !node.has_key?(chr)
      node = node[chr]
    end

    node
  end

  # @param {string} prefix
  # @return {boolean}
  # Returns if there is any word in the trie
  # that starts with the given prefix.
  def starts_with(prefix)
    search_helper(prefix)
    return false if node.nil?

    queue = [node]
    while !queue.empty? do
      node = queue.shift
      return true if node.is_word
      node.children.each do |k, v|
        queue << v
      end
    end
    return false
  end
end

# Your Trie object will be instantiated and called as such:
# trie = Trie.new
# trie.insert("somestring")
# trie.search("key")
