require 'minitest/autorun'
require '../h_index'

describe 'h_index(citations)' do
  it 'should work1' do
    citations = [3, 0, 6, 1, 5]
    expected_result = 3
    h_index(citations).must_equal(expected_result)
  end

  it 'should work2' do
    citations = [0]
    expected_result = 0
    h_index(citations).must_equal(expected_result)
  end
end
