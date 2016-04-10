require 'minitest/autorun'
require '../ugly_number'

describe 'is_ugly(num)' do
  it 'should work1' do
    num = 1
    expected_result = true
    is_ugly(num).must_equal(expected_result)

    num = 2
    expected_result = true
    is_ugly(num).must_equal(expected_result)

    num = 6
    expected_result = true
    is_ugly(num).must_equal(expected_result)

    num = 8
    expected_result = true
    is_ugly(num).must_equal(expected_result)

    num = 14
    expected_result = false
    is_ugly(num).must_equal(expected_result)
  end
end
