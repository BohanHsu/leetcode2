require 'minitest/autorun'
require '../group_anagrams'

describe 'group_anagrams(strs)' do
  it 'should work1' do
    strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
    expected_result = [
      ["ate", "eat","tea"],
      ["nat","tan"],
      ["bat"]
    ]
    expected_result.each do |collection|
      collection.sort!
    end
    actual_result = group_anagrams(strs)
    actual_result.each do |collection|
      collection.sort!
    end
    actual_result.sort.must_equal(expected_result.sort)
  end
end
