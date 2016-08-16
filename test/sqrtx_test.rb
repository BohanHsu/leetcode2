require 'minitest/autorun'
require '../sqrtx'

describe 'my_sqrt(x)' do
  it 'should work1' do
    (0..100).each do |num|
      my_sqrt(num).must_equal(Math::sqrt(num).to_i)
    end
  end
end
