require 'minitest/autorun'
require '../word_ladder'

describe 'ladder_length(begin_word, end_word, word_list)' do
  it 'should work1' do
    begin_word = 'hit'
    end_word = 'cog'
    word_list = ["hot","dot","dog","lot","log"]
    expected_result = 5
    ladder_length(begin_word, end_word, word_list).must_equal(expected_result)

    begin_word = 'hit'
    end_word = 'xbh'
    word_list = ["hot","dot","dog","lot","log"]
    expected_result = 0
    ladder_length(begin_word, end_word, word_list).must_equal(expected_result)
  end
end
