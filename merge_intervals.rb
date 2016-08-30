# Definition for an interval.
class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end

  def to_s
    "[#{@start}, #{@end}]"
  end
end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  intervals = intervals.sort do |a, b|
    if a.start != b.start
      res = a.start - b.start
    else
      res = a.end - b.end
    end
    res
  end

  i = 0
  new_intervals = []

  while i < intervals.length do
    j = i + 1
    max_end = intervals[i].end
    while j < intervals.length && intervals[j].start <= max_end do
      max_end = [max_end, intervals[j].end].max
      j += 1
    end
    new_intervals << Interval.new(intervals[i].start, max_end)
    i = j
  end
  return new_intervals
end
