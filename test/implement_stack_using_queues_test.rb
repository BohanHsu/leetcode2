require 'minitest/autorun'
require '../implement_stack_using_queues'

describe 'Stack' do
  it 'should work1' do
    commands = [
      [:push, 1],
      [:push, 2],
      [:push, 3],
      [:push, 4],
      [:push, 5],
      [:top],
      [:empty],
      [:pop],
      [:top],
      [:empty],
      [:pop],
      [:top],
      [:empty],
      [:push, 6],
      [:pop],
      [:top],
      [:empty],
      [:pop],
      [:top],
      [:empty],
      [:pop],
      [:top],
      [:empty],
      [:pop],
      [:top],
      [:empty]
    ]

    s = S.new
    stack = Stack.new

    commands.each do |command|
      cmd = command[0]
      if command.length == 2
        expected_result = s.send(cmd, command[1])
        actual_result = s.send(cmd, command[1])
      else
        expected_result = s.send(cmd)
        actual_result = s.send(cmd)
      end
      actual_result.must_equal(expected_result)
    end
  end
end


class S
  # Initialize your data structure here.
  def initialize
    @stack = []
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    @stack << x
    nil
  end

  # @return {void}
  def pop
    @stack.pop
  end

  # @return {Integer}
  def top
    @stack.last
  end

  # @return {Boolean}
  def empty
    @stack.empty?
  end
end
