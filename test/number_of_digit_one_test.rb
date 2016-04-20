require 'minitest/autorun'
require '../number_of_digit_one'

describe 'count_digit_one(n)' do
  it 'should work1' do
    (1..10000).each do |i|
      puts "i=#{i}"
      count_digit_one(i).must_equal(brutal_force(i))
    end
  end

  it 'should work2' do

    n = 1011
    count_digit_one(n).must_equal(brutal_force(n))
    n = 1000
    count_digit_one(n).must_equal(brutal_force(n))
    n = 100
    count_digit_one(n).must_equal(brutal_force(n))
    n = 20
    count_digit_one(n).must_equal(brutal_force(n))
    n = 10
    count_digit_one(n).must_equal(brutal_force(n))
    n = 11
    count_digit_one(n).must_equal(brutal_force(n))
  end
end

def brutal_force(n)
  return (1..n).inject(0) do |memo, obj|
    memo + (1..obj).inject(0) do |mem, i|
      i.to_s.chars.each.select do |j|
        (j.ord - "0".ord) == 1
      end.length
    end
  end
end
