require 'minitest/autorun'

class Node
  attr_accessor :array
  def initialize(array)
    @array = array
  end
end

# @param {String[]} stickers
# @param {String} target
# @return {Integer}
def min_stickers(stickers, target)
  target_array = 26.times.map {0}
  max_array = 26.times.map {0}

  target.chars.each do |chr|
    i = idx(chr)
    if i < 0 || i > 26
      return false
    end

    target_array[i] += 1
  end


  all_array = 26.times.map {0}
  counts = stickers.map do |sticker|
    array = 26.times.map {0}
    sticker.chars.each do |chr|
      array[idx(chr)] += 1

      all_array[idx(chr)] += 1
    end

    (0...26).each do |i|
      if array[i] > max_array[i]
        max_array[i] = array[i]
      end
    end

    array
  end

  target.chars.each do |chr|
    if all_array[idx(chr)] == 0
      return -1
    end
  end

  puts "max_array=#{convert_array(max_array)}"
  
  map = {}

  max_array.each_with_index do |val, i|
    if val != 0
      map[i] = counts.select do |word_array|
        word_array[i] == val
      end
    end
  end

  #puts "map=#{map}"
  map.each do |k, v|
    puts "map[#{k}] (#{(k+'a'.ord).chr})=#{map[k].map {|arr| convert_array(arr)}}"
  end

  puts "===================================="

  return helper(Float::INFINITY, map, target_array, 0)
end

def helper(short_circuit, map, target_array, current_cnt)
  puts "helper(short_circuit=#{short_circuit}, target_array=#{convert_array(target_array)} ,current_cnt=#{current_cnt})"
  #if current_cnt > short_circuit
  #  return Float::INFINITY
  #end

  cnt_zero = 0
  target_array.each do |val|
    if val == 0
      cnt_zero += 1
    end
  end

  if cnt_zero == 26
    puts "found!"
    return 0 
  end

  max_cnt = 0
  max_idx = []
  target_array.each_with_index do |val, i|
    if val > 0
      if !map.has_key?(i)
        return -1
      end

      #puts "i=#{i}"
      capacity = map[i][0][i]
      cnt = val / capacity + (val % capacity == 0 ? 0 : 1)
      if cnt > max_cnt
        max_cnt = cnt
        max_idx = []
        max_idx << i
      elsif cnt == max_cnt
        max_idx << i
      end
    
    end
  end

  #puts "max_idx=#{max_idx}"

  min_result = Float::INFINITY
  candidate_words = []
  max_idx.each do |idx|
    candidate_words += map[idx]
  end

  candidate_words.each do |word_array|
    puts "candidate_word=#{convert_array(word_array)}"
    this_result = helper(min_result, map, reduce_target(target_array, word_array, max_cnt), max_cnt + current_cnt)
    if this_result < min_result
      min_result = this_result
    end
  end
  
  puts "return=(current_cnt=#{current_cnt}, max_cnt=#{max_cnt}, min_result=#{min_result}), total=#{current_cnt + max_cnt + min_result}"
  return current_cnt + max_cnt + min_result
end

def reduce_target(target_array, word_array, n)
  new_array = 26.times.map {0}

  target_array.each_with_index do |val, i|
    if val - n * word_array[i] > 0
      #puts "new_array=#{new_array}"
      new_array[i] = val - n * word_array[i]
    end
  end

  return new_array
end

#def combine(array1, array2)
#  new_array = 26.times.map {0}
#  array1.each_with_index do |val, i|
#    new_array[i] += val
#  end
#
#  array2.each_with_index do |val, i|
#    new_array[i] += val
#  end
#
#  return new_array
#end

#def leave_node(node, target_array)
#  target_array.each_with_index do |val, i|
#    #puts "target_array.val=#{val}, node.array[i]=#{node.array[i]}"
#    if val > node.array[i]
#      return false
#    end
#  end
#  
#  return true
#end

def idx(chr)
  return chr.ord - 'a'.ord
end

describe 'min_stickers(stickers, target)' do
  it 'should work1' do
    stickers = ["with", "example", "science"]
    target = "thehat"
    expected_result = 3
    min_stickers(stickers, target).must_equal(expected_result)
  end
    
  it 'should work2' do
    stickers = ["notice", "possible"]
    target = "basicbasic"
    expected_result = -1
    min_stickers(stickers, target).must_equal(expected_result)
  end
end

def puts_array(array)
  p convert_array(array)
end

def convert_array(array)
  result = ""
  array.each_with_index do |val, i|
    val.times do
      result += (i + 'a'.ord).chr
    end
  end

  return result
end
