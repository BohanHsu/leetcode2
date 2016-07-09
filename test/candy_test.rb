require 'minitest/autorun'
require '../candy'

describe 'candy(ratings)' do
  it 'should work1' do
    ratings = [1,2,3,4,5]
    expected_result = 15
    candy(ratings).must_equal(expected_result)

    ratings = [1,2,3,4,100]
    expected_result = 15
    candy(ratings).must_equal(expected_result)

    ratings = [1,2,3,4,100,1]
    expected_result = 16
    candy(ratings).must_equal(expected_result)

    ratings = [1,2,3,4,100,101]
    expected_result = 21
    candy(ratings).must_equal(expected_result)

    ratings = [2,1,2,3,4,100,101]
    expected_result = 23
    candy(ratings).must_equal(expected_result)

    ratings = [1,1,2,3,4,100,101]
    expected_result = 22
    candy(ratings).must_equal(expected_result)

    ratings = [1,1,2,2,3,4,100,101]
    expected_result = 19
    candy(ratings).must_equal(expected_result)

    ratings = [1]
    expected_result = 1
    candy(ratings).must_equal(expected_result)

    ratings = []
    expected_result = 0
    candy(ratings).must_equal(expected_result)
  end

  it 'should work2' do
  end 
end
