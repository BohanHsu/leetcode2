# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  from = 1
  to = nums.length - 1

   while true do
     from, to = check_range(nums, from, to)
     if from == to
       return from
     end
   end
end

def check_range(nums, from, to)
  mid = (from + to) / 2

  nums.each.select do |ele|
    ele <= mid && ele >= from
  end.length > mid - from + 1 ? [from, mid] : [mid + 1, to]
end
