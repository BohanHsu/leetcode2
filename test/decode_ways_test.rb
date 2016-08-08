require 'minitest/autorun'
require '../decode_ways'

describe 'num_decodings(s)' do
  it 'should work1' do
    s = '12'
    expected_result = 2
    num_decodings(s).must_equal(expected_result)

    s = '123'
    expected_result = 3
    num_decodings(s).must_equal(expected_result)

    s = ''
    expected_result = 0
    num_decodings(s).must_equal(expected_result)

    s = '103'
    expected_result = 1
    num_decodings(s).must_equal(expected_result)
  end


  it 'should work2' do
  end
end
