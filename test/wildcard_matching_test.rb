require 'minitest/autorun'
require '../wildcard_matching'

describe 'is_match(s, p)' do
  it 'should work1' do
    is_match("aa","a").must_equal(false)
    is_match("aa","aa").must_equal(true)
    is_match("aaa","aa").must_equal(false)
    is_match("aa", "*").must_equal(true)
    is_match("aa", "a*").must_equal(true)
    is_match("ab", "?*").must_equal(true)
    is_match("aab", "c*a*b").must_equal(false)

    is_match("a", "?*").must_equal(true)
    is_match("a", "*?*").must_equal(true)
    is_match("a", "*?").must_equal(true)

    is_match("aaa", "*?**?*").must_equal(true)
    is_match("aaa", "*?*?*?*").must_equal(true)
    is_match("aaa", "****").must_equal(true)

    is_match("aaaa", "*?**?*").must_equal(true)
    is_match("aaaa", "*?*?*?*").must_equal(true)

    is_match("aaaa", "*?**b*").must_equal(false)
    is_match("aaaa", "*?*b*?*").must_equal(false)
  end

  it 'should work2' do
    is_match("abefcdgiescdfimde", "ab*cd?i*de").must_equal(true)
  end
end
