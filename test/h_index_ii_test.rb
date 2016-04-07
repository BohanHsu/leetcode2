require 'minitest/autorun'
require '../h_index_ii'

describe 'h_index(citations)' do
  it 'should work1' do
    citations = [0,1,3,5,6]
    expected_result = 3
    h_index(citations).must_equal(expected_result)
  end
end
