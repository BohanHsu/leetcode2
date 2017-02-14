require 'minitest/autorun'
require '../integer_break'

describe 'integer_break(n)' do
  it 'should' do
    integer_break(8).must_equal(18)
  end
end
