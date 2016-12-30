require 'minitest/autorun'
require '../substring_with_concatenation_of_all_words'

describe 'find_substring(s, words)' do
  it 'should work1' do
    s = "barfoothefoobarman"
    words = ["foo", "bar"]
    expected_result = [0,9]
    find_substring(s, words).sort.must_equal(expected_result.sort)

    s = "barfoothefoobarmanabarfoo"
    words = ["foo", "bar"]
    expected_result = [0,9,19]
    find_substring(s, words).sort.must_equal(expected_result.sort)

    s = "barfoofoobarthefoobarman"
    words = ["bar","foo","the"]
    expected_result = [6,9,12]
    find_substring(s, words).sort.must_equal(expected_result.sort)

    s = "wordgoodgoodgoodbestword"
    words = ["word","good","best","good"]
    expected_result = [8]
    find_substring(s, words).sort.must_equal(expected_result.sort)
    
    s = "foobarfoobar"
    words = ["foo","bar"]
    expected_result = [0,3,6]
    find_substring(s, words).sort.must_equal(expected_result.sort)
  end

  it 'should work2' do
    s = "abababab"
    words = ["a","b","a"]
    expected_result = [0,2,4]
    find_substring(s, words).sort.must_equal(expected_result.sort)
  end
end
