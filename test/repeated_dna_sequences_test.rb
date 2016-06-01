require 'minitest/autorun'
require '../repeated_dna_sequences'

describe 'find_repeated_dna_sequences(s)' do
  it 'should work1' do
    s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
    expected_result = ["AAAAACCCCC", "CCCCCAAAAA"]
    actual_result = find_repeated_dna_sequences(s)
    actual_result.sort.must_equal(expected_result.sort)

    s = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    expected_result = ["AAAAAAAAAA"]
    actual_result = find_repeated_dna_sequences(s)
    actual_result.sort.must_equal(expected_result.sort)

    s = "AA"
    expected_result = []
    actual_result = find_repeated_dna_sequences(s)
    actual_result.sort.must_equal(expected_result.sort)

    s = "AAAAAAAAACAAAAAAAAATAAAAAAAAAGAAAAAAAAA"
    expected_result = []
    actual_result = find_repeated_dna_sequences(s)
    actual_result.sort.must_equal(expected_result.sort)
  end
end
