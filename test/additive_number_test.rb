require 'minitest/autorun'
require '../additive_number'

describe 'is_additive_number(num)' do
  it 'should work1' do
    num = '112358'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)

    num = '199100199'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)

    num = '112359'
    expected_result = false
    is_additive_number(num).must_equal(expected_result)
  end

  it 'should work2' do
    num = '0'
    expected_result = false
    is_additive_number(num).must_equal(expected_result)
  end

  it 'should work3' do
    num = '1023'
    expected_result = false
    is_additive_number(num).must_equal(expected_result)

    num = '101'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)
  end

  it 'should work4' do
    num = '211738'
    expected_result = true
    is_additive_number(num).must_equal(expected_result)
  end
end
