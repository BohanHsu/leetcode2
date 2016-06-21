require 'minitest/autorun'
require '../evaluate_reverse_polish_notation'

describe 'eval_rpn(tokens)' do
  it 'should work1' do
    tokens = ["2", "1", "+", "3", "*"]
    expected_result = 9
    eval_rpn(tokens).must_equal(expected_result)

    tokens = ["4", "13", "5", "/", "+"]
    expected_result = 6
    eval_rpn(tokens).must_equal(expected_result)

    tokens = ["8", "2", '-']
    expected_result = 6
    eval_rpn(tokens).must_equal(expected_result)
  end

  it 'should work2' do
    tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
    expected_result = 22
    eval_rpn(tokens).must_equal(expected_result)
  end
end

