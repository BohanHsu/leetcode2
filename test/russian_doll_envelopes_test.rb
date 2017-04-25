require 'minitest/autorun'
require '../russian_doll_envelopes'

describe 'max_envelopes(envelopes)' do
  it 'should work1' do
    envelopes = [[5,4],[6,4],[6,7],[2,3]]
    expected_result = 3
    max_envelopes(envelopes).must_equal(expected_result)
  end
end
