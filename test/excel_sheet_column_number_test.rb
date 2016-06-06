require 'minitest/autorun'
require '../excel_sheet_column_number'

describe 'title_to_number(s)' do
  it 'should work1' do
    s = "A"
    expected_result = 1
    title_to_number(s).must_equal(expected_result)

    s = "AA"
    expected_result = 27
    title_to_number(s).must_equal(expected_result)

    s = "AB"
    expected_result = 28
    title_to_number(s).must_equal(expected_result)
  end
end
