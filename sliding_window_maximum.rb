# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  results = []
  return results if k == 0
  heap = Heap.new(k)
  nums.each_with_index do |num, i|
    if i < k
      heap.add(num)
    else
      results << heap.peek
      heap.delete(nums[i-k])
      heap.add(num)
    end
    puts "i=#{i}, num=#{num}, #{heap}"
  end
  if heap.size > 0
    results << heap.peek
  end
  results
end

class Heap
  def to_s
  end

  def initialize(k)
  end

  def add(num)
  end

  def delete(num)
  end

  def peek
  end
end
