require 'minitest/autorun'
require '../bulb_switcher'

describe 'sqrt(n)' do
  it 'should work1' do
    10000.times do |i|
      sqrt(i).must_equal(Math.sqrt(i).to_i)
    end
  end
end
