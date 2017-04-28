require 'minitest/autorun'
require '../count_numbers_with_unique_digits'

describe 'count_numbers_with_unique_digits(n)' do
  it 'should work1' do
    12.times do |n|
      puts "n=#{n}"
      #count_numbers_with_unique_digits(n).must_equal(brutal_force(n))
      count_numbers_with_unique_digits(n)
    end
  end

  #it 'should work2' do
  #  brutal_force(15).must_equal(brutal_force(16))
  #end

  it 'should work3' do
    count_numbers_with_unique_digits(2).must_equal(brutal_force(2))
  end
end

def brutal_force(n)
  count = 0
  (10 ** n).times do |i|
    if is_unique_digit?(i)
      count += 1
    end
  end

  return count
end

def is_unique_digit?(n)
  hsh = {}
  n.to_s.chars.each do |chr|
    if hsh.has_key?(chr)
      return false
    end
    hsh[chr] = true
  end

  return true
end
