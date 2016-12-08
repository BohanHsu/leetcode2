require 'minitest/autorun'
require '../letter_combinations_of_a_phone_number'

describe 'letter_combinations(digits)' do
  it 'should work1' do
    digits = "23"
    expected_result23 = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    letter_combinations(digits).sort.must_equal(expected_result23.sort)

    digits = "234"
    expected_result234 = "ghi".chars.map do |letter|
      expected_result23.map do |str|
        str + letter
      end
    end.inject([]) do |memo, obj|
      memo + obj
    end
    letter_combinations(digits).sort.must_equal(expected_result234.sort)

    digits = "2349"
    expected_result2349 = "wxyz".chars.map do |letter|
      expected_result234.map do |str|
        str + letter
      end
    end.inject([]) do |memo, obj|
      memo + obj
    end
    letter_combinations(digits).sort.must_equal(expected_result2349.sort)

    digits = "23409"
    letter_combinations(digits).sort.must_equal(expected_result2349.sort)
  end

  it 'should work2' do
    digits = ""
    expected_result = []
    letter_combinations(digits).sort.must_equal(expected_result.sort)
  end
end
