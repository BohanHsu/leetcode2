# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  left = []
  middle = []
  right = []
  intervals.each_with_index do |itvl, idx|
    itvl_start = itvl.start
    itvl_end = itvl.end

    if itvl_end < new_interval.start
      left << itvl
    elsif itvl_start > new_interval.end
      right << itvl
    else
      middle << itvl
    end
  end

  if !middle.empty? && middle[0].start < new_interval.start
    new_interval.start = middle[0].start
  end

  if !middle.empty? && middle[-1].end > new_interval.end
    new_interval.end = middle[-1].end
  end

  #puts "left=#{left}, right=#{right}, middle=#{middle}"

  return left + [new_interval] + right
end
