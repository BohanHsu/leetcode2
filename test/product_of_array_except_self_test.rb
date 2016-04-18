require 'minitest/autorun'
require '../product_of_array_except_self'

describe 'product_except_self(nums)' do
  it 'should work1' do
    nums = [1,2,3,4]
    excepted_result = [24,12,8,6]
    product_except_self(nums).must_equal(excepted_result)

    nums = []
    excepted_result = []
    product_except_self(nums).must_equal(excepted_result)

    nums = [0,0,0]
    excepted_result = [0,0,0]
    product_except_self(nums).must_equal(excepted_result)

    nums = [1,0]
    excepted_result = [0,1]
    product_except_self(nums).must_equal(excepted_result)
  end
end
