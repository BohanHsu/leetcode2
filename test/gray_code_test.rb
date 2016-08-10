require 'minitest/autorun'
require '../gray_code'

describe 'gray_code(n)' do
  it 'should work1' do
    n = 0
    expected_result = [0]
    gray_code(n).must_equal(expected_result)

    n = 1
    expected_result = [0,1]
    gray_code(n).must_equal(expected_result)

    n = 2
    expected_result = [0,1,3,2]
    gray_code(n).must_equal(expected_result)

    n = 3
    expected_result = [0,1,3,2,6,7,5,4]
    gray_code(n).must_equal(expected_result)
    
    n = 4
    expected_result = [0,1,3,2,6,7,5,4,12,13,15,14,10,11,9,8]
    gray_code(n).must_equal(expected_result)
  end
end
