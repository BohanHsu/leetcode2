require 'minitest/autorun'
require '../combinations'

describe 'combine(n, k)' do
  it 'should work1' do
    n = 4
    k = 2
    expected_result = [
      [2,4],
      [3,4],
      [2,3],
      [1,2],
      [1,3],
      [1,4],
    ]
    combine(n, k).sort.must_equal(expected_result.sort)

    n = 4
    k = 1
    expected_result = [
      [2],
      [3],
      [1],
      [4]
    ]
    combine(n, k).sort.must_equal(expected_result.sort)

    n = 4
    k = 3
    expected_result = [
      [2,3,4],
      [1,3,4],
      [1,2,4],
      [1,2,3]
    ]
    combine(n, k).sort.must_equal(expected_result.sort)

    n = 4
    k = 0
    expected_result = [
    ]
    combine(n, k).sort.must_equal(expected_result.sort)

    n = 0
    k = 0
    expected_result = [
    ]
    combine(n, k).sort.must_equal(expected_result.sort)
  end
end
