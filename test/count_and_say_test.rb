require 'minitest/autorun'
require '../count_and_say'

describe 'count(n)' do
  it 'should work1' do
    n = 1
    expected_result = 11
    count(n).must_equal(expected_result.to_i)

    n = 11
    expected_result = 21
    count(n).must_equal(expected_result.to_i)

    n = 21
    expected_result = 1211
    count(n).must_equal(expected_result.to_i)

    n = 1211
    expected_result = 111221
    count(n).must_equal(expected_result.to_i)
  end
end

describe 'count_and_say(n)' do
  it 'should work2' do
    nums = [1,11,21,1211,111221].map do |i|
      i.to_s
    end

    nums.each_with_index do |expected_result, i|
      count_and_say(i + 1).must_equal(expected_result)
    end
  end
end
