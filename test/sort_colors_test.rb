require 'minitest/autorun'
require '../sort_colors'

describe 'sort_colors(nums)' do
  it 'should work1' do
    nums = [2,1,1,1,2,2,2,0,0,0,0,2,1,1,2,0]
    sort_colors(nums).must_equal(nums.sort)
  end
end
