require 'minitest/autorun'
require '../rectangle_area'

describe 'compute_area(a, b, c, d, e, f, g, h)' do
  it 'should work2' do
    a,b,c,d,e,f,g,h=-3,0,3,4,0,-1,9,2
    expected_result = 24 + 27 - 6
    compute_area(a, b, c, d, e, f, g, h).must_equal(expected_result)
  end
end

describe 'union(a, b, c, d, e, f, g, h)' do
  it 'should work1' do
    a,b,c,d,e,f,g,h=-3,0,3,4,0,-1,9,2
    expected_result = 6
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,0,-1,9,3
    expected_result = 9
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,0,-1,9,1
    expected_result = 3
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,0,-1,9,0
    expected_result = 0
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,0,-11,9,-8
    expected_result = 0
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,10,-1,19,2
    expected_result = 0
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)

    a,b,c,d,e,f,g,h=-3,0,3,4,10,-11,19,-8
    expected_result = 0
    union(a, b, c, d, e, f, g, h).must_equal(expected_result)
  end
end
