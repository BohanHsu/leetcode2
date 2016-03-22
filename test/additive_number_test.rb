require 'minitest/autorun'
require '../additive_number'

describe 'is_additive_number(num)' do
  it 'should work1' do
    num = '112358'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)

    num = '199100199'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)

    num = '112359'
    expected_result = false
    is_additive_number(num).must_equal(expected_result)
  end
end
