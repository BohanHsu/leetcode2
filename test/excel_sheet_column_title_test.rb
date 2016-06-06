require 'minitest/autorun'
require '../excel_sheet_column_title'

describe 'convert_to_title(n)' do
  it 'should work1' do
    n = 1
    expected_result = "A"
    convert_to_title(n).must_equal(expected_result)

    n = 26
    expected_result = "Z"
    convert_to_title(n).must_equal(expected_result)

    n = 26 * 27
    expected_result = "ZZ"
    convert_to_title(n).must_equal(expected_result)

    n = 27
    expected_result = "AA"
    convert_to_title(n).must_equal(expected_result)

    n = 28
    expected_result = "AB"
    convert_to_title(n).must_equal(expected_result)
  end
end
