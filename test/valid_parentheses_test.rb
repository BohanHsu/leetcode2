require 'minitest/autorun'
require '../valid_parentheses.rb'

describe 'is_valid(s)' do
  it 'should work1' do
    s = "{()}[]"
    expected_result = true
    is_valid(s).must_equal(expected_result)

    s = "{()[]"
    expected_result = false
    is_valid(s).must_equal(expected_result)

    s = "()}[]"
    expected_result = false
    is_valid(s).must_equal(expected_result)
  end
end
