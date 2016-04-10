require 'minitest/autorun'
require '../ugly_number'
require '../ugly_number_ii'

describe 'nth_ugly_number(n)' do
  it 'should both work1' do
    n = 10
    expected_result = 12
    brutel_force(n).must_equal(expected_result)
    nth_ugly_number(n).must_equal(expected_result)
  end

  it 'should work2' do
    (1..100).each do |n|
      nth_ugly_number(n).must_equal(brutel_force(n))
    end
  end
end

def brutel_force(n)
  i = 1
  count = 0
  while count != n do
    if is_ugly(i)
      count += 1
    end
    i += 1
  end
  return i - 1
end
