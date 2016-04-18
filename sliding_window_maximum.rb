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
    #puts "i=#{i}, num=#{num}, #{heap}"
  end
  if heap.count > 0
    results << heap.peek
  end
  results
end

class Heap
  attr_accessor :count
  def initialize(k)
    @k = k
    @hash = {}
    @array = k.times.map do
      nil
    end
    @count = 0
    @next = k.times.map do |i|
      i
    end.reverse
    @index = {}
  end

  def add(num)
    if @hash.has_key?(num)
      @hash[num] += 1
    else
      @hash[num] = 1

      i = @next.pop
      @array[i] = num
      @index[num] = i
      f_i = get_father_index(i)
      while f_i >= 0 && @array[f_i] < @array[i] do
        tmp = @index[@array[f_i]]
        @index[@array[f_i]] = @index[@array[i]]
        @index[@array[i]] = tmp

        tmp = @array[f_i]
        @array[f_i] = @array[i]
        @array[i] = tmp

        i = f_i
        f_i = get_father_index(i)
      end
    end

    @count += 1
  end

  def delete(num)
    if @hash[num] > 1
      @hash[num] -= 1
    else
      @hash.delete(num)
      i = @index[num]
      @index.delete(num)
      @array[i] = nil

      l_i = get_left_child_index(i)
      r_i = get_right_child_index(i)

      while l_i < @k && !@array[l_i].nil? || r_i < @k && !@array[r_i].nil? do
        if @array[l_i].nil? || r_i < @k && !@array[r_i].nil? && @array[l_i] < @array[r_i]
          @index[@array[r_i]] = i

          tmp = @array[i]
          @array[i] = @array[r_i]
          @array[r_i] = tmp

          i = r_i
        else
          @index[@array[l_i]] = i

          tmp = @array[i]
          @array[i] = @array[l_i]
          @array[l_i] = tmp

          i = l_i
        end
        l_i = get_left_child_index(i)
        r_i = get_right_child_index(i)
      end
      @next << i
    end
    @count -= 1
  end

  def peek
    @array[0]
  end

  def to_s
    "#{@array}, #{@hash}, #{@count}, @next=#{@next}, @index=#{@index}"
  end

  def get_father_index(i)
    (i - 1) / 2
  end

  def get_left_child_index(i)
    (i + 1) * 2 - 1
  end

  def get_right_child_index(i)
    (i + 1) * 2
  end
end
