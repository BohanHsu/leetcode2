class NumArray

  # Initialize your data structure here.
  # @param {Integer[]} nums
  def initialize(nums)
    @nums = nums

    @bit = nums.map do
      0
    end + [0]

    nums.each_with_index do |ele, idx|
      update_bit(idx, ele)
    end
  end

  def update_bit(i, val)
    i += 1
    while i < @bit.length do
      @bit[i] += val
      i += (i & -i)
    end
  end

  # @param {Integer} i
  # @param {Integer} val
  # @return {Integer}
  def update(i, val)
    diff_val = val - @nums[i]
    @nums[i] = val
    update_bit(i, diff_val)
  end

  # @param {Integer} i
  # @param {Integer} j
  # @return {Integer}
  def sum_range(i, j)
    return read_bit(j+1) - read_bit(i)
  end

  def read_bit(i)
    sum = 0
    while i > 0 do
      sum += @bit[i]
      i -= (i & -i)
    end
    sum
  end
end

# Your NumArray object will be instantiated and called as such:
# num_array = NumArray.new(nums)
# num_array.sum_range(0, 1)
# num_array.update(1, 10)
# num_array.sum_range(0, 2)
