require 'minitest/autorun'
require '../permutation_sequence'

describe 'get_permutation(n, k)' do
  it 'should work1' do
    n1 = ["1"]

    n2 = ["12",
          "21"]

    n3 = ["123",
          "132",
          "213",
          "231",
          "312",
          "321"]

    n4 = ["1234",
          "1243",
          "1324",
          "1342",
          "1423",
          "1432",
          "2134",
          "2143",
          "2314",
          "2341",
          "2413",
          "2431",
          "3124",
          "3142",
          "3214",
          "3241",
          "3412",
          "3421",
          "4123",
          "4132",
          "4213",
          "4231",
          "4312",
          "4321"]

    n = 1
    n1.each_with_index do |expected_result, m|
      k = m+1
      get_permutation(n, k).must_equal(expected_result)
    end

    n = 2
    n2.each_with_index do |expected_result, m|
      k = m+1
      get_permutation(n, k).must_equal(expected_result)
    end

    n = 3
    n3.each_with_index do |expected_result, m|
      k = m+1
      get_permutation(n, k).must_equal(expected_result)
    end

    n = 4
    n4.each_with_index do |expected_result, m|
      k = m+1
      get_permutation(n, k).must_equal(expected_result)
    end
  end

  it 'should work2' do
    n = 3
    k = 1
    expected_result = "123"
    get_permutation(n, k).must_equal(expected_result)
  end
end
