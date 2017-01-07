require 'minitest/autorun'
require '../search_for_a_range'

describe 'search_range(nums, target)' do
  it 'should work1' do
    nums = [5,7,7,8,8,10]
    target = 8
    expected_result = [3,4]
    search_range(nums, target).must_equal(expected_result)

    nums = [5,7,7,8,8,10]
    target = 18
    expected_result = [-1,-1]
    search_range(nums, target).must_equal(expected_result)

    nums = []
    target = 18
    expected_result = [-1,-1]
    search_range(nums, target).must_equal(expected_result)

    nums = [7]
    target = 18
    expected_result = [-1,-1]
    search_range(nums, target).must_equal(expected_result)

    nums = [18]
    target = 18
    expected_result = [0,0]
    search_range(nums, target).must_equal(expected_result)
  end

  it 'should pass brutal force test exist' do
    1000.times do
      nums = generate_random_nums()
      target = generate_exist_target(nums)
      search_range(nums, target).must_equal(brutal_force(nums, target))
    end
  end

  it 'should pass brutal force test non exist left' do
    1000.times do
      nums = generate_random_nums()
      target = generate_non_exist_target_left(nums)
      search_range(nums, target).must_equal(brutal_force(nums, target))
    end
  end

  it 'should pass brutal force test non exist right' do
    1000.times do
      nums = generate_random_nums()
      target = generate_non_exist_target_right(nums)
      search_range(nums, target).must_equal(brutal_force(nums, target))
    end
  end

  it 'should pass brutal force test non exist middle' do
    1000.times do
      nums = generate_random_nums()
      target = generate_non_exist_target_middle(nums)
      if !target.nil?
        search_range(nums, target).must_equal(brutal_force(nums, target))
      end
    end
  end
end

def generate_random_nums()
  len = rand(30)
  nums = len.times.map do |ele|
    rand(len)
  end

  return nums.sort
end

def generate_exist_target(nums)
  return nums.sample
end

def generate_non_exist_target_left(nums)
  return 0 if nums.empty?
  return nums[0] - 100
end

def generate_non_exist_target_right(nums)
  return 0 if nums.empty?
  return nums[-1] + 100
end

def generate_non_exist_target_middle(nums)
  nums.each_with_index do |e, i|
    if i < nums.length
      if e + 1 != nums[i+1]
        return e + 1
      end
    end
  end
  return nil
end

def brutal_force(nums, target)
  s_index = -1
  e_index = -1
  nums.each_with_index do |e, i|
    if i == 0 && e == target || i != 0 && e == target && nums[i-1] < target
      s_index = i
    end

    if i == nums.length - 1 && e == target || i != nums.length - 1 && e == target && nums[i+1] > target
      e_index = i
    end
  end

  return [s_index, e_index]
end
