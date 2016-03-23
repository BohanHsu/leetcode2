class NumArray

  # Initialize your data structure here.
  # @param {Integer[]} nums
  def initialize(nums)
    @no_data = nums.nil? || nums.empty?
    return if @no_data
    @nums = nums.map do
      0
    end

    nums.each_with_index do |ele, idx|
      @nums[idx] = ele + (idx == 0 ? 0 : @nums[idx - 1])
    end
  end

  def get_sum(i)
    return 0 if i < 0
    return @nums[i]
  end

  # @param {Integer} i
  # @param {Integer} j
  # @return {Integer}
  def sum_range(i, j)
    return 0 if @no_data
    return get_sum(j) - get_sum(i-1)
  end
end

# Your NumArray object will be instantiated and called as such:
# num_array = NumArray.new(nums)
# num_array.sum_range(0, 1)
# num_array.sum_range(0, 2)
