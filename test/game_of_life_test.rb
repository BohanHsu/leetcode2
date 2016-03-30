require 'minitest/autorun'
require '../game_of_life'

describe 'game_of_life(board)' do
  it 'should work1' do
    board = [
      [1,1],
      [1,0]
    ]

    next_generation = [
      [1,1],
      [1,1]
    ]
    game_of_life(board).must_equal(next_generation)
  end

  it 'should work2' do
    board = [
      [1,0,0,0,0,1],
      [0,0,0,1,1,0],
      [1,0,1,0,1,0],
      [1,0,0,0,1,0],
      [1,1,1,1,0,1],
      [0,1,1,0,1,0],
      [1,0,1,0,1,1],
      [1,0,0,1,1,1],
      [1,1,0,0,0,0]
    ]

    next_generation = [
      [0,0,0,0,1,0],
      [0,1,0,1,1,1],
      [0,1,0,0,1,1],
      [1,0,0,0,1,1],
      [1,0,0,0,0,1],
      [0,0,0,0,0,0],
      [1,0,1,0,0,0],
      [1,0,1,1,0,1],
      [1,1,0,0,1,0]
    ]
    game_of_life(board).must_equal(next_generation)
  end
end
