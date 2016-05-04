# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  skylines = []
  return skylines if buildings.empty?

  heap = MaxHeap.new
  point_hsh = {}
  buildings.each do |building|
    point_hsh[building[0]] = true
    point_hsh[building[1]] = true
  end
  points = point_hsh.keys.sort
  prev_height = 0
  j = 0

  points.each do |i|
    while !heap.empty? && heap.peek[1] <= i do
      heap.pop
    end

    while j < buildings.length && buildings[j][0] <= i do
      heap.push(buildings[j][2], buildings[j])
      j += 1
    end

    if heap.empty?
      cur_height = 0
    else
      cur_height = heap.peek[2]
    end

    if cur_height != prev_height
      skylines << [i, cur_height]
    end
    prev_height = cur_height
  end

  skylines
end

class Heap
  def initialize
    @array = []
  end

  def empty?
    @array.empty?
  end

  def ip(i)
    (i + 1) / 2 - 1
  end

  def il(i)
    (i + 1) * 2 - 1
  end

  def ir(i)
    (i + 1) * 2
  end

  def swap(i, j)
    tmp = @array[i]
    @array[i] = @array[j]
    @array[j] = tmp
    nil
  end

  def to_s
    @array.to_s
  end
end

class MaxHeap < Heap
  def push(key, val)
    @array << [key, val]
    i = @array.length - 1

    while i >= 0 && ip(i) >= 0 do
      if @array[i][0] >= @array[ip(i)][0]
        swap(i, ip(i))
        i = ip(i)
      else
        break
      end
    end
  end

  def pop
    result = @array[0]
    if @array.length > 1
      @array[0] = @array.pop
    else
      @array = []
    end

    i = 0
    while il(i) < @array.length && @array[i][0] < @array[il(i)][0] || ir(i) < @array.length && @array[i][0] < @array[ir(i)][0] do
      if ir(i) < @array.length && @array[ir(i)][0] > @array[il(i)][0]
        swap(i, ir(i))
        i = ir(i)
      else
        swap(i, il(i))
        i = il(i)
      end
    end

    result[1]
  end

  def peek
    @array[0][1]
  end
end
