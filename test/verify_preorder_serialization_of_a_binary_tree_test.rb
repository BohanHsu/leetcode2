require 'minitest/autorun'
require '../verify_preorder_serialization_of_a_binary_tree'

describe 'is_valid_serialization(preorder)' do
  it 'should work1' do
    preorder = "9,3,4,#,#,1,#,#,2,#,6,#,#"
    expected_result = true
    is_valid_serialization(preorder).must_equal(expected_result)

    preorder = "1,#"
    expected_result = false
    is_valid_serialization(preorder).must_equal(expected_result)

    preorder = "9,#,#,1"
    expected_result = false
    is_valid_serialization(preorder).must_equal(expected_result)

    preorder = "#,#"
    expected_result = false
    is_valid_serialization(preorder).must_equal(expected_result)

    preorder = "#"
    expected_result = true
    is_valid_serialization(preorder).must_equal(expected_result)

    preorder = ""
    expected_result = true
    is_valid_serialization(preorder).must_equal(expected_result)
  end
end
