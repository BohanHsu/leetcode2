require 'minitest/autorun'
require '../add_binary'

describe 'add_binary(a, b)' do
  it 'should work1' do
    a_decimal = 1
    b_decimal = 1
    a = a_decimal.to_s(2)
    b = b_decimal.to_s(2)
    expected_result = (a_decimal+b_decimal).to_s(2)
    add_binary(a, b).must_equal(expected_result)
  end

  it 'should work2' do
    100.times do |a_decimal|
      100.times do |b_decimal|
        a = a_decimal.to_s(2)
        b = b_decimal.to_s(2)
        expected_result = (a_decimal+b_decimal).to_s(2)
        add_binary(a, b).must_equal(expected_result)
      end
    end
  end
end
