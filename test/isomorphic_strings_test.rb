require 'minitest/autorun'
require '../isomorphic_strings'

describe 'is_isomorphic(s, t)' do
  it 'should work1' do
    s = "egg"
    t = "add"
    expected_result = true
    is_isomorphic(s, t).must_equal(expected_result)

    s = "foo"
    t = "bar"
    expected_result = false
    is_isomorphic(s, t).must_equal(expected_result)

    s = "paper"
    t = "title"
    expected_result = true
    is_isomorphic(s, t).must_equal(expected_result)
  end

  it 'should work2' do
    s = ''
    t = ''
    expected_result = true
    is_isomorphic(s, t).must_equal(expected_result)
  end
end
