# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  skylines = []
  heap = MaxHeap.new
  left_boundry = buildings.map do |building|
    building[0]
  end.min

  right_boundry = buildings.map do |building|
    building[1]
  end.max
  
  prev_height = 0
  j = 0

  puts "left_boundry=#{left_boundry}, right_boundry=#{right_boundry}"

  (left_boundry..(right_boundry + 1)).each do |i|
    while j < buildings.length && buildings[j][1] <= i do
      heap.push(buildings[j][2], buildings[j])
      j += 1
    end

    while !heap.empty? && heap.peek[1] < i do
      heap.pop
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

  #skylines << [right_boundry, 0]
  skylines
end

class MaxHeap
  def initialize
    @array = []
  end

  def push(key, val)
    @array << [key, val]
    i = @array.length - 1

    #puts "@array=#{@array}"
    #puts "i=#{i}"
    while i >= 0 && ip(i) >= 0 do
      if @array[i][0] >= @array[ip(i)][0]
        #puts "i=#{i}, ip(i)=#{ip(i)}"
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
