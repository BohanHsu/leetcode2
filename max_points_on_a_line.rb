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
  return 0 if points.empty?
  cur_max = 0

  hsh = {}
  points.each do |point|
    if !hsh.has_key?(point.x)
      hsh[point.x] = {}
    end
    if !hsh[point.x].has_key?(point.y)
      hsh[point.x][point.y] = 0
    end

    hsh[point.x][point.y] += 1
  end

  points = []
  hsh.each do |x, val|
    val.each do |y, cnt|
      points << Point.new(x, y)
      cur_max = [cur_max, cnt].max
    end
  end

  #cur_max = points.empty? ? 0 : 1

  lines = {}
  vertical = {}

  points.length.times do |j|
    j.times do |i|
      if points[j].x != points[i].x
        a = Rational(points[j].y - points[i].y) / Rational(points[j].x - points[i].x)
        b = points[j].y - points[j].x * a

        #puts "i=#{i}, j=#{j}, a=#{a}, b=#{b}, lines=#{lines}"

        if !(lines.has_key?(a) && lines[a].has_key?(b))
          lines[a] = {} if !lines.has_key?(a)
          lines[a][b] = hsh[points[i].x][points[i].y] + hsh[points[j].x][points[j].y]
          
          ((j + 1)...points.length).each do |k|
            if points[k].y == points[k].x * a + b
              lines[a][b] = lines[a][b] + hsh[points[k].x][points[k].y]
              #puts "k=#{k}, points[k].y=#{points[k].y}, points[k].x=#{points[k].x}, a=#{a}, b=#{b}"
            end
          end
          cur_max = [cur_max, lines[a][b]].max
        end
      else
        x_val = points[j].x
        if !vertical.has_key?(x_val)
          vertical[x_val] = hsh[points[i].x][points[i].y] + hsh[points[j].x][points[j].y]
          ((j + 1)...points.length).each do |k|
            vertical[x_val] = vertical[x_val] + hsh[points[k].x][points[k].y] if points[k].x == x_val
          end
          cur_max = [cur_max, vertical[x_val]].max
        end
      end
      #puts "i=#{i}, j=#{j}, cur_max=#{cur_max}"
    end
  end
  cur_max
end
