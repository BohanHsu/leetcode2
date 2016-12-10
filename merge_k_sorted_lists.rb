# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  heap = Heap.new(lists.length)
  new_head = ListNode.new(nil)
  tail = new_head


  lists.each do |list|
    if !list.nil?
      heap.push(list.val, list)
    end
  end

  while !heap.empty? do
    list = heap.pop
    tail.next = list
    tail = tail.next
    list = list.next
    if !list.nil?
      heap.push(list.val, list)
    end
  end

  tail.next = nil
  return new_head.next
end

class Heap
  def initialize(size)
    @arr = size.times.map {nil}
    @size = 0
  end

  def push(val, obj)
    @arr[@size] = [val, obj]
    i = @size
    while i > 0 && @arr[i][0] < @arr[(i-1)/2][0] do
      swap(@arr, i, (i-1)/2)
      i = (i-1) / 2
    end
    @size += 1
  end

  def pop()
    val = @arr[0][1]
    @size -= 1
    @arr[0] = @arr[@size]
    @arr[@size] = nil

    i = 0
    while ((i*2+1) < @size && @arr[i][0] > @arr[(i*2+1)][0]) || ((i*2+2) < @size && @arr[i][0] > @arr[(i*2+2)][0]) do
      if (i*2+2) < @size && @arr[(i*2+2)][0] < @arr[(i*2+1)][0]
        swap(@arr, i, i*2+2)
        i = i*2+2
      else
        swap(@arr, i, i*2+1)
        i = i*2+1
      end
    end

    return val
  end

  def empty?
    return @size == 0
  end

  def swap(arr, i, j)
    tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
  end
end
