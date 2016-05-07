require 'minitest/autorun'
require '../combination_sum_iii'

describe 'combination_sum3(k, n)' do
  it 'should work1' do
    k = 3
    n = 7
    expected_result = [[1,2,4]]  
    (combination_sum3 k, n).must_equal expected_result

    k = 3
    n = 9
    expected_result = [[1,2,6], [1,3,5], [2,3,4]]
    (combination_sum3 k, n).must_equal expected_result

    k = 3
    n = 0
    expected_result = []  
    (combination_sum3 k, n).must_equal expected_result

    k = 0
    n = 3
    expected_result = []  
    (combination_sum3 k, n).must_equal expected_result
  end
end
