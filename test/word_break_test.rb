require 'minitest/autorun'
require '../word_break'

describe 'word_break(s, word_dict)' do
  it 'should work1' do
    s = 'leetcode'
    word_dict = ['leet', 'code']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)

    s = 'leet'
    word_dict = ['leet', 'code']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)

    s = 'leetcodeleet'
    word_dict = ['leet', 'code']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)

    s = 'aaaaaaaaaa'
    word_dict = ['aaaaaaa', 'aaaa', 'a']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)

    s = 'aaaaaaaaaa'
    word_dict = ['aaaaaaa', 'aaaa', 'aa']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)

    s = 'aaaaaaaaaa'
    word_dict = ['aaaaaaa', 'aaaa']
    expected_result = false
    word_break(s, word_dict).must_equal(expected_result)

    s = 'aaaaaaabaaa'
    word_dict = ['aaaaaaa', 'aaaa', 'a']
    expected_result = false
    word_break(s, word_dict).must_equal(expected_result)

    s = ''
    word_dict = ['aaaaaaa', 'aaaa', 'a']
    expected_result = false
    word_break(s, word_dict).must_equal(expected_result)
  end

  it 'should work2' do
    s = 'cars'
    word_dict = ['ca', 'rs', 'car']
    expected_result = true
    word_break(s, word_dict).must_equal(expected_result)
  end
end
