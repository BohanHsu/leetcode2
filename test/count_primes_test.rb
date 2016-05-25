require 'minitest/autorun'
require '../count_primes'

def is_prime(n)
  return true if n == 3 || n == 2
  (2...n).each do |i|
    return false if n % i == 0
  end
  true
end

def native_count_primes(n)
  (2...n).each.map do |i|
    is_prime(i)
  end.select do |is_p|
    is_p
  end.length
end

describe 'count_primes(n)' do
  it 'should work1' do
    (2...100).each do |i|
      count_primes(i).must_equal(native_count_primes(i))
    end
  end

  it 'should work2' do
    i = 4
    count_primes(i).must_equal(native_count_primes(i))
  end

  it 'should work3' do
    i = 0
    count_primes(i).must_equal(native_count_primes(i))
  end
end
