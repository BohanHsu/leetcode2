require 'minitest/autorun'
require '../compare_version_numbers'

describe 'compare_version(version1, version2)' do
  it 'should work1' do
    expected_result = ["0.1", "1.1", "1.2", "13.37"] 
    expected_result.shuffle.sort {|va, vb| compare_version(va, vb)}.must_equal(expected_result)
  end

  it 'should work2' do
    va = "1.1"
    vb = "1.1.1"
    expected_result = -1
    compare_version(va, vb).must_equal(expected_result)

    va = "1.1"
    vb = "1.1"
    expected_result = 0
    compare_version(va, vb).must_equal(expected_result)

    va = "1.1.1.1"
    vb = "1.1.1"
    expected_result = 1
    compare_version(va, vb).must_equal(expected_result)
  end

  it 'should work2' do
    va = "1.1.0"
    vb = "1.1"
    expected_result = 0
    compare_version(va, vb).must_equal(expected_result)

    va = "1.1"
    vb = "1.1.0"
    expected_result = 0
    compare_version(va, vb).must_equal(expected_result)

    va = "1.1"
    vb = "1.1.0.1"
    expected_result = -1
    compare_version(va, vb).must_equal(expected_result)
  end
end
