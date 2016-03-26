require 'minitest/autorun'
require '../bulls_and_cows'

describe 'get_hint(secret, guess)' do
  it 'should work1' do
    secret = "1123"
    guess = "0111"
    expected_result = "1A1B"
    get_hint(secret, guess).must_equal(expected_result)

    secret = "1807"
    guess = "7810"
    expected_result = "1A3B"
    get_hint(secret, guess).must_equal(expected_result)
  end
end
