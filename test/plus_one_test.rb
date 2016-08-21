require 'minitest/autorun'
require '../plus_one'

describe 'plus_one(digits)' do
  it 'should work1' do
    digits = [1,2,3,4,5]
    expected_result = [1,2,3,4,6]
    plus_one(digits).must_equal(expected_result)

    digits = [9,9,9]
    expected_result = [1,0,0,0]
    plus_one(digits).must_equal(expected_result)

    digits = []
    expected_result = [1]
    plus_one(digits).must_equal(expected_result)
  end
end
