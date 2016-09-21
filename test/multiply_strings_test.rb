require 'minitest/autorun'
require '../multiply_strings'

describe 'arr_mult_num(arr, n)' do
  it 'should work1' do
    100.times do |i|
      100.times do |j|
        arr_mult_num(i.to_s.split("").map(&:to_i), j).join("").to_i.must_equal(i*j)
      end
    end
  end
end

describe 'arr_add_arr(arr1, arr2)' do
  it 'should work2' do
    100.times do |i|
      100.times do |j|
        arr_add_arr(i.to_s.split("").map(&:to_i), j.to_s.split("").map(&:to_i)).join("").to_i.must_equal(i+j)
      end
    end
  end
end

describe 'multiply(num1, num2)' do
  it 'should work3' do
    100.times do |i|
      100.times do |j|
        multiply(i.to_s, j.to_s).must_equal((i*j).to_s)
      end
    end
  end

  it 'should work4' do
    100.times do |i|
      100.times do |j|
        multiply("000"+i.to_s, "000"+j.to_s).must_equal((i*j).to_s)
      end
    end
  end

  it 'should work5' do
    i = 20
    j = 5
    multiply("000"+i.to_s, "000"+j.to_s).must_equal((i*j).to_s)
  end
end
