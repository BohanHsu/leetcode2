require 'minitest/autorun'
require '../super_ugly_number'

describe 'nth_super_ugly_number(n, primes)' do
  it 'should work1' do
    n = 12
    primes = [2,7,13,19]
    expected_result = 32
    nth_super_ugly_number(n, primes).must_equal(expected_result)

    n = 11
    primes = [2,7,13,19]
    expected_result = 28
    nth_super_ugly_number(n, primes).must_equal(expected_result)

    n = 10
    primes = [2,7,13,19]
    expected_result = 26
    nth_super_ugly_number(n, primes).must_equal(expected_result)

    n = 9
    primes = [2,7,13,19]
    expected_result = 19
    nth_super_ugly_number(n, primes).must_equal(expected_result)

    n = 8
    primes = [2,7,13,19]
    expected_result = 16
    nth_super_ugly_number(n, primes).must_equal(expected_result)

    n = 7
    primes = [2,7,13,19]
    expected_result = 14
    nth_super_ugly_number(n, primes).must_equal(expected_result)
  end

  it 'should work2' do
    n = 1
    primes = [2,7,13,19]
    expected_result = 1
    nth_super_ugly_number(n, primes).must_equal(expected_result)
  end
end
