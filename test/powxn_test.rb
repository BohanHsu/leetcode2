require 'minitest/autorun'
require '../powxn'

describe 'my_pow(x, n)' do
  it 'should work1' do
    20.times do |x|
      6.times do |n|
        my_pow(x, n).must_equal(x ** n)
      end
    end

    (-20..0).each do |x|
      6.times do |n|
        my_pow(x, n).must_equal(x ** n)
      end
    end

    x = 2
    n = -3
    expected_result = 1/8.0
    my_pow(x, n).must_equal(expected_result)
  end

  it 'should work2' do
  end
end
