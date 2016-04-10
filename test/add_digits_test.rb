require 'minitest/autorun'
require '../add_digits'

describe 'add_digits(num)' do
  it 'should work1' do
    num = 38
    expected_result = 2
    add_digits(num).must_equal(expected_result)

    num = 178167
    expected_result = 3
    add_digits(num).must_equal(expected_result)

    num = 1
    expected_result = 1
    add_digits(num).must_equal(expected_result)

    num = 0
    expected_result = 0
    add_digits(num).must_equal(expected_result)
  end
end
