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
  end
  if heap.size > 0
    results << heap.peek
  end
  results
end

class Heap
  attr_accessor :size
  def to_s
    "#{@array}, @counts=#{@counts}"
  end

  def initialize(k)
    @counts = {}
    @k = k
    @array = k.times.map do
      nil
    end
    @size = 0
  end

  def add(num)
    if !@counts.has_key?(num)
      @array[@size] = num
      @size += 1
      heapify_add
      @counts[num] = 0
    end
    @counts[num] += 1
    num
  end

  def heapify_add
    i = @size - 1
    while i > 0 do
      i_f = (i + 1) / 2 - 1
      if i_f > @size || @array[i_f] > @array[i]
        return
      end

      tmp = @array[i_f]
      @array[i_f] = @array[i]
      @array[i] = tmp
      i = i_f
    end
  end

  def pop
    num = @array[0]
    if @counts[num] > 1
      @counts[num] -= 1
      return num
    end

    @counts.delete(num)
    @array[0] = @array[@size - 1]
    @array[@size - 1] = nil
    @size -= 1

    heapify_pop
    num
  end

  def heapify_pop
    heapify_delete(0)
  end

  def heapify_delete(i)
    while i < @size do
      i_l = (i + 1) * 2 - 1
      i_r = (i + 1) * 2
      if i_l < @size && @array[i] < @array[i_l] || i_r < @size && @array[i] < @array[i_r]
        swap = i_r < @size ? (@array[i_l] > @array[i_r] ? i_l : i_r) : i_l

        tmp = @array[swap]
        @array[swap] = @array[i]
        @array[i] = tmp
        i = swap
      else
        return
      end
    end
  end

  def delete(num)
    if @counts[num] > 1
      @counts[num] -= 1
    elsif @counts[num] == 1
      idx = @array.find_index(num)
      @array[idx] = @array[@size - 1]
      @array[@size - 1] = nil
      @size -= 1
      heapify_delete(idx)
      @counts.delete(num)
    end
  end

  def peek
    return @array[0]
  end
end
