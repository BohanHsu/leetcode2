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
  cur_max = points.empty? ? 0 : 1
  lines = {}
  vertical = {}

  points.length.times do |j|
    j.times do |i|
      if points[j].x != points[i].x
        a = (points[j].y - points[i].y).to_f / (points[j].x - points[i].x).to_f
        b = points[j].y - points[j].x * a

        #puts "i=#{i}, j=#{j}, a=#{a}, b=#{b}"

        if !(lines.has_key?(a) && lines[a].has_key?(b))
          lines[a] = {} if !lines.has_key?(a)
          lines[a][b] = 1
          
          ((i + 1)...points.length).each do |k|
            if points[k].y == points[k].x * a + b
              lines[a][b] = lines[a][b] + 1 
              #puts "k=#{k}, points[k].y=#{points[k].y}, points[k].x=#{points[k].x}, a=#{a}, b=#{b}"
            end
          end
          cur_max = [cur_max, lines[a][b]].max
        end
      else
        x_val = points[j].x
        if !vertical.has_key?(x_val)
          vertical[x_val] = 1
          ((i + 1)...points.length).each do |k|
            vertical[x_val] = vertical[x_val] + 1 if points[k].x == x_val
          end
          cur_max = [cur_max, vertical[x_val]].max
        end
      end
      #puts "i=#{i}, j=#{j}, cur_max=#{cur_max}"
    end
  end
  cur_max
end
