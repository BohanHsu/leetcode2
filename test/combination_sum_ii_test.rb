require 'minitest/autorun'
require '../combination_sum_ii'

describe 'combination_sum2(candidates, target)' do
  it 'should work1' do
    candidates = [10,1,2,7,6,1,5]
    target = 8


    expected_result = [[1, 7],
      [1, 2, 5],
      [2, 6],
      [1, 1, 6]
    ]

    actual_result = combination_sum2(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end

  it 'should work2' do
    candidates = [10]
    target = 8


    expected_result = []

    actual_result = combination_sum2(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end

  it 'should work3' do
    candidates = [0]
    target = 8

    expected_result = []

    actual_result = combination_sum2(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end

    candidates = [1,2,4]
    target = 8

    expected_result = []

    actual_result = combination_sum2(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end

  it 'should work4' do
    candidates = [2,2,2]
    target = 4

    expected_result = [[2,2]]

    actual_result = combination_sum2(candidates, target)
    actual_result.sort.must_equal(expected_result.sort)
    actual_result.each do |path|
      path.must_equal(path.sort)
    end
  end
end
