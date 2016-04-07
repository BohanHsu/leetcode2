require 'minitest/autorun'
require '../h_index_ii'

describe 'h_index(citations)' do
  it 'should work1' do
    citations = [0,1,3,5,6]
    expected_result = 3
    h_index(citations).must_equal(expected_result)
  end

  it 'should work2' do
    citations = [6,6,6,6,6]
    expected_result = 5
    h_index(citations).must_equal(expected_result)
  end

  it 'should work3' do
    citations = [0,0,0,0,0,6]
    expected_result = 1
    h_index(citations).must_equal(expected_result)
  end

  it 'should work4' do
    citations = []
    expected_result = 0
    h_index(citations).must_equal(expected_result)
  end

  it 'should work5' do
    citations = [0]
    expected_result = 0
    h_index(citations).must_equal(expected_result)

    citations = [0,0]
    expected_result = 0
    h_index(citations).must_equal(expected_result)

    citations = [0,0,0]
    expected_result = 0
    h_index(citations).must_equal(expected_result)
  end
end
