require "minitest/autorun"
require "../reverse_string"

describe 'reverse_string(s)' do
  it 'should work1' do
    s = ""
    reverse_string(s).must_equal(s.reverse)

    s = "a"
    reverse_string(s).must_equal(s.reverse)

    s = "ab"
    reverse_string(s).must_equal(s.reverse)

    s = "abc"
    reverse_string(s).must_equal(s.reverse)
  end
end
