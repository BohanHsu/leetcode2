require 'minitest/autorun'
require '../roman_to_integer'
require '../integer_to_roman'

describe 'roman_to_int(s)' do
  it 'should work1' do
    s = "MCCXXXIV"
    expected_result = 1234
    roman_to_int(s).must_equal(expected_result)
  end

  it 'should work2' do
    4000.times do |i|
      s = int_to_roman(i)
      #puts "s=#{s}"
      roman_to_int(s).must_equal(i)
    end
  end
end
