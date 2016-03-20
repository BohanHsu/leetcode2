require 'minitest/autorun'
require '../burst_balloons'

describe 'Tree' do
  before(:each) do
    @tree = Tree.new
  end

  it 'should work1' do
    @tree.set([1,2,3,4], 10)
    @tree.get([1,2,3,4]).must_equal(10)
    @tree.get([1,2,3,4,5]).must_equal(nil)
    @tree.set([1,2,3,4,5],11)
    @tree.get([1,2,3,4,5]).must_equal(11)
    @tree.get([1,2,3]).must_equal(nil)
  end
end

describe '' do
  it 'should work1' do
    nums = [3, 1, 5, 8]
    expected_result = 167
    max_coins(nums).must_equal(expected_result)

    nums = [1]
    expected_result = 1
    max_coins(nums).must_equal(expected_result)

    nums = [0]
    expected_result = 0
    max_coins(nums).must_equal(expected_result)

    nums = []
    expected_result = 0
    max_coins(nums).must_equal(expected_result)
  end
end
