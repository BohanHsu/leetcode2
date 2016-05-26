require 'minitest/autorun'
require '../bitwise_and_of_numbers_range'

def brutal_force(m, n)
  (m..n).inject(2 ** 32 - 1) do |memo, obj|
    memo & obj
  end
end

describe 'left_most_bit(n)' do
  it 'should work2' do
    left_most_bit(0).must_equal(0)
    left_most_bit(4).must_equal(3)
    left_most_bit(5).must_equal(3)
    left_most_bit(6).must_equal(3)
    left_most_bit(7).must_equal(3)
    left_most_bit(8).must_equal(4)
  end
end



describe 'range_bitwise_and' do
  it 'should return same resule as burtal_force1' do
    (0...1000).each do |n|
      (0..n).each do |m|
        #puts "m=#{m}, n=#{n}"
        range_bitwise_and(m, n).must_equal(brutal_force(m, n))
      end
    end
  end

  it 'should work3' do
    m = 1
    n = 1
    range_bitwise_and(m, n).must_equal(brutal_force(m, n))
  end
end
