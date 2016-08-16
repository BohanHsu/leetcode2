require 'minitest/autorun'
require '../simplify_path'

describe 'simplify_path(path)' do
  it 'should work1' do
  path = "/home/"
  expected_result = "/home"
  simplify_path(path).must_equal(expected_result)

  path = "/a/./b/../../c/"
  expected_result = "/c"
  simplify_path(path).must_equal(expected_result)

  path = "/"
  expected_result = "/"
  simplify_path(path).must_equal(expected_result)

  path = "/a"
  expected_result = "/a"
  simplify_path(path).must_equal(expected_result)

  path = "/a//b"
  expected_result = "/a/b"
  simplify_path(path).must_equal(expected_result)
  end
end
