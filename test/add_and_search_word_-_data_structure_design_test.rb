require 'minitest/autorun'
require '../add_and_search_word_-_data_structure_design'

describe 'WordDictionary' do
  it 'should add word' do
    wd = WordDictionary.new

    wd.add_word("bad")
    wd.add_word("dad")
    wd.add_word("mad")
    wd.search("pad").must_equal(false)
    wd.search("bad").must_equal(true)
    wd.search(".ad").must_equal(true)
    wd.search("b..").must_equal(true)

    wd.search(".").must_equal(false)
    wd.search("..").must_equal(false)
    wd.search("...").must_equal(true)

    wd.add_word("b")
    wd.search("b").must_equal(true)
    wd.search(".").must_equal(true)
  end

  it 'should work2' do
    wd = WordDictionary.new

    wd.add_word("a")
    wd.add_word("a")
    wd.search(".").must_equal(true)
    wd.search("a").must_equal(true)
    wd.search("aa").must_equal(false)
    wd.search("a").must_equal(true)
    wd.search(".a").must_equal(false)
    wd.search("a.").must_equal(false)

    [true,true,false,true,false,false]
  end
end
