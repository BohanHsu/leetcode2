require 'minitest/autorun'
require '../power_of_four'

describe 'is_power_of_four(num)' do
  it 'should work1' do
    ((-1)...1000).each do |num|
      is_power_of_four(num).must_equal(brute_force(num))
    end
  end
end

def brute_force(num)
  while num > 1 do
    if num % 4 != 0
      return false
    end

    num = num / 4
  end

  return num == 1
end
