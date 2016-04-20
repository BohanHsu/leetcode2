require 'minitest/autorun'
require '../implement_queue_using_stacks'


describe 'Queue' do
  it 'should work1' do
    @queue = MyQueue.new
    @q = Q.new
    commands = [
      [:peek],
      [:push, 1],
      [:push, 2],
      [:push, 3],
      [:push, 4],
      [:push, 5],
      [:peek],
      [:empty],
      [:peek],
      [:peek],
      [:empty],
      [:pop],
      [:peek],
      [:peek],
      [:push, 6],
      [:push, 7],
      [:push, 8],
      [:peek],
      [:empty],
      [:pop],
      [:peek],
      [:pop],
      [:peek],
      [:pop],
      [:peek],
      [:pop],
      [:peek],
      [:pop],
      [:empty],
      [:peek],
      [:pop],
      [:peek],
      [:pop],
      [:empty]
    ]

    commands.each do |command|
      if command.length == 2
        argument = command[1]
        command = command[0]
        actual_result = @queue.send(command, argument)
        expected_result = @q.send(command, argument)
      else
        command = command[0]
        actual_result = @queue.send(command)
        expected_result = @q.send(command)
      end
      actual_result.must_equal(expected_result)
    end
  end
end

class Q
  # Initialize your data structure here.
  def initialize
    @queue = []
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    @queue << x
    nil
  end

  # @return {void}
  def pop
    @queue.shift
    nil
  end

  # @return {Integer}
  def peek
    if @queue.length == 0
      return nil
    end
    @queue.first
  end

  # @return {Boolean}
  def empty
    @queue.empty?
  end
end
