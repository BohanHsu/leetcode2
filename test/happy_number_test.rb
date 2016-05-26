require 'minitest/autorun'
require '../happy_number'

describe 'is_happy(n)' do
  it 'should work1' do
    n = 82
    expected_result = true
    is_happy(n).must_equal(expected_result)

    n = 2
    expected_result = false
    is_happy(n).must_equal(expected_result)
  end
end
