require 'minitest/autorun'
require '../distinct_subsequences'

describe 'num_distinct(s, t)' do
  it 'should work1' do

    s = 'rabbbit'
    t = 'racit'
    expected_result = 0
    num_distinct(s,t).must_equal(expected_result)

    s = 'raadbbbit'
    t = 'radbit'
    expected_result = 6
    num_distinct(s,t).must_equal(expected_result)

    s = 'raabbbit'
    t = 'rabit'
    expected_result = 6
    num_distinct(s,t).must_equal(expected_result)

    s = 'aaaa'
    t = 'aa'
    expected_result = 6
    num_distinct(s,t).must_equal(expected_result)
  end

  it 'should work2' do
    s = 'rabbbit'
    t = 'rabit'
    expected_result = 3
    num_distinct(s,t).must_equal(expected_result)
  end
end
