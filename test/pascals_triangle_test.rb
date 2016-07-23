require 'minitest/autorun'
require '../pascals_triangle'

describe 'generate(num_rows)' do
  it 'should work1' do
    num_rows = 5
    expected_result = [
      [1],
      [1,1],
      [1,2,1],
      [1,3,3,1],
      [1,4,6,4,1]
    ]
    generate(num_rows).must_equal(expected_result)

    num_rows = 2
    expected_result = [
      [1],
      [1,1]
    ]
    generate(num_rows).must_equal(expected_result)
  end
end
