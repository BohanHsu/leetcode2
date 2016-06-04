# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  height = dungeon.length
  return 1 if height == 0
  width = dungeon.first.length
  return 1 if width == 0

  balance = dungeon.map do |row|
    row.map do
      nil
    end
  end

  balance[height-1][width-1] = dungeon.last.last < 0 ? -dungeon.last.last : 0
  stack = [[0, 0]]

  while !stack.empty? do
    i, j = stack.last
    if i < height - 1 && balance[i+1][j].nil? || j < width - 1 && balance[i][j+1].nil?
      if i < height - 1 && balance[i+1][j].nil?
        stack << [i+1, j]
      end
      if j < width - 1 && balance[i][j+1].nil?
        stack << [i, j+1]
      end
    elsif i < height - 1 || j < width - 1
      selection = []
      if i < height - 1
        selection << balance[i+1][j] - dungeon[i][j]
      end
      if j < width - 1
        selection << balance[i][j+1] - dungeon[i][j]
      end

      balance[i][j] = selection.empty? ? 0 : selection.min < 0 ? 0 : selection.min
      stack.pop
    else
      stack.pop
    end
  end
  return balance[0][0] + 1
end
