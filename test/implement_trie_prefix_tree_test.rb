require 'minitest/autorun'
require '../implement_trie_prefix_tree'

describe 'Trie' do
  it 'should work1' do
    trie = Trie.new
    trie.insert('abc')
    trie.search('ab').must_equal(false)
    trie.search('abc').must_equal(true)
    trie.search('abd').must_equal(false)
    trie.search('abcd').must_equal(false)
    trie.search('').must_equal(false)
    trie.starts_with("").must_equal(true)
    trie.starts_with("a").must_equal(true)
    trie.starts_with("ab").must_equal(true)
    trie.starts_with("abc").must_equal(true)
    trie.starts_with("abd").must_equal(false)
    trie.starts_with("acd").must_equal(false)
    trie.starts_with("accd").must_equal(false)

    trie.insert('ab')
    trie.search('ab').must_equal(true)
    trie.search('abc').must_equal(true)
    trie.search('abd').must_equal(false)
    trie.search('abcd').must_equal(false)
    trie.search('').must_equal(false)
    trie.starts_with("").must_equal(true)
    trie.starts_with("a").must_equal(true)
    trie.starts_with("ab").must_equal(true)
    trie.starts_with("abc").must_equal(true)
    trie.starts_with("abd").must_equal(false)
    trie.starts_with("acd").must_equal(false)
    trie.starts_with("accd").must_equal(false)
  end
end
