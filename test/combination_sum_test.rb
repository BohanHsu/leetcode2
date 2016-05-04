require 'minitest/autorun'
require '../combination_sum'

describe 'combination_sum(candidates, target)' do
  it 'should work1' do
    candidates = [2,3,6,7]
    target = 7
    expected_result = [[2,2,3], [7]]
    actual_result = combination_sum(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end

  it 'should work2' do
    candidates = [2,3,6,7]
    target = 1
    expected_result = []
    actual_result = combination_sum(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end

  it 'should work3' do
    candidates = []
    target = 1
    expected_result = []
    actual_result = combination_sum(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end
end
