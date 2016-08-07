require 'minitest/autorun'
require '../interleaving_string'

describe 'is_interleave(s1, s2, s3)' do
  it 'should work1' do
    s1 = "aabcc"
    s2 = "dbbca"
    s3 = "aadbbcbcac"
    expected_result = true
    is_interleave(s1, s2, s3).must_equal(expected_result)

    s1 = "aabcc"
    s2 = "dbbca"
    s3 = "aadbbbaccc"
    expected_result = false
    is_interleave(s1, s2, s3).must_equal(expected_result)

    s1 = "aaaaa"
    s2 = "aaaab"
    s3 = "aaaaaaaaba"
    expected_result = true
    is_interleave(s1, s2, s3).must_equal(expected_result)

    s1 = "aaaaa"
    s2 = ""
    s3 = "aaaaa"
    expected_result = true
    is_interleave(s1, s2, s3).must_equal(expected_result)

    s1 = ""
    s2 = "aaaaa"
    s3 = "aaaaa"
    expected_result = true
    is_interleave(s1, s2, s3).must_equal(expected_result)

    s1 = ""
    s2 = ""
    s3 = ""
    expected_result = true
    is_interleave(s1, s2, s3).must_equal(expected_result)
  end

  it 'should work2' do
  end
end
