require 'minitest/autorun'
require '../dungeon_game'

describe 'calculate_minimum_hp(dungeon)' do
  it 'should work1' do
    dungeon = [
      [-2, -3, 3],
      [-5, -10, 1],
      [10, 30, -5]
    ]
    expected_result = 7
    calculate_minimum_hp(dungeon).must_equal(expected_result)

    dungeon = [
    ]
    expected_result = 1
    calculate_minimum_hp(dungeon).must_equal(expected_result)
  end

  it 'should work2' do
    dungeon = [
      [10]
    ]
    expected_result = 1
    calculate_minimum_hp(dungeon).must_equal(expected_result)
  end

  it 'should work3' do
    dungeon = [
      [2],
      [1]
    ]
    expected_result = 1
    calculate_minimum_hp(dungeon).must_equal(expected_result)
  end

  it 'should work4' do
    dungeon = [
      [-100]
    ]
    expected_result = 101
    calculate_minimum_hp(dungeon).must_equal(expected_result)
  end

  it 'should work5' do
    dungeon = [
      [-1, -1, -1],
      [-1, -1, -1],
      [-1, -1, -1]
    ]
    expected_result = 6
    calculate_minimum_hp(dungeon).must_equal(expected_result)
  end
end
