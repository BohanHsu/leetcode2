# Definition for a point.
class Point
  attr_accessor :x, :y
  def initialize(x=0, y=0)
    @x = x
    @y = y
  end
end

# @param {Point[]} points
# @return {Integer}
def max_points(points)
  cur_max = 0
  lines = {}
  vertical = {}

  points.length.times do |j|
    j.times do |i|
      if points[j].x != points[i].x
        a = (points[j].y - points[i].y).to_f / (points[j].x - points[i].x).to_f
        b = points[j].y - points[i].x * a

        if !(lines.has_key?(a) && lines[a].has_key?(b))
          lines[a] = {} if !lines.has_key?(a)
          lines[a][b] = 2
          
          ((j + 1)...points.length).each do |k|
            lines[a][b] = lines[a][b] + 1 if points[k].y = points[k].x * a + b
          end
        end
        cur_max = [cur_max, lines[a][b]].max
      else
        x_val = points[j].x
        if !vertical.has_key?(x_val)
          vertical[x_val] = 2
          ((j + 1)...points.length).each do |k|
            vertical[x_val] = vertical[x_val] + 1 if points[k].x == x_val
          end
        end
        cur_max = [cur_max, vertical[x_val]]
      end
    end
  end
  cur_max
end
