require 'minitest/autorun'
require '../divide_two_integers'

describe 'divide(dividend, divisor)' do
  it 'should work1' do
    100.times do |i|
      100.times do |j|
        divide(i,j).must_equal(j == 0 ? 2 ** 31 -1 : i/j)
      end
    end

    100.times do |i|
      100.times do |j|
        i = -i
        divide(i,j).must_equal(j == 0 ? 2 ** 31 -1 : i/j)
      end
    end

    100.times do |i|
      100.times do |j|
        j = -j
        divide(i,j).must_equal(j == 0 ? 2 ** 31 -1 : i/j)
      end
    end

    100.times do |i|
      100.times do |j|
        i = -i
        j = -j
        divide(i,j).must_equal(j == 0 ? 2 ** 31 -1 : i/j)
      end
    end
  end

  it 'should work2' do
    i = 2
    j = 1
    divide(i,j).must_equal(j == 0 ? 2 ** 31 -1 : i/j)
  end

  it 'should work3' do
    i = -2147483648
    j = -1
    divide(i,j).must_equal(2147483647)
  end

  it 'should work4' do
    i = 1004958205
    j = -2137325331
    puts divide(i,j)
    divide(i,j).must_equal(i/j)
  end
end
