# @param {Integer[]} x
# @return {Boolean}
def is_self_crossing(x)
  return false if x.length < 3

  lines = []
  current_position = [0,0]
  x.each_with_index do |ele, idx|
    case idx % 4
    when 0
      new_position = [current_position[0], current_position[1] + ele]
    when 1
      new_position = [current_position[0] - ele, current_position[1]]
    when 2
      new_position = [current_position[0], current_position[1] - ele]
    when 3
      new_position = [current_position[0] + ele, current_position[1]]
    else
    end
    lines.each do |line|
      check_cross_with_current = check_cross(line, [current_position, new_position])
      if check_cross_with_current
        return true
      end
    end
    if lines.length == 6
      lines.shift
    end
    lines << [current_position, new_position]
    current_position = new_position
  end
  return false
end

# @param {Integer[]} x
# @return {Boolean}
def check_cross(line1, line2)
  if line1[0][0] == line1[1][0] && line2[0][0] == line2[1][0]
    return false
  end

  if line1[0][1] == line1[1][1] && line2[0][1] == line2[1][1]
    return false
  end

  if line1[0][0] == line1[1][0] && line2[0][0] != line2[1][0]
    vertical_line = line1
    horizontal_line = line2
  else
    vertical_line = line2
    horizontal_line = line1
  end
  a = horizontal_line[0][1] >= [vertical_line[0][1], vertical_line[1][1]].min
  b = horizontal_line[0][1] <= [vertical_line[0][1], vertical_line[1][1]].max
  c = vertical_line[0][0] >= [horizontal_line[0][0], horizontal_line[1][0]].min
  d = vertical_line[0][0] <= [horizontal_line[0][0], horizontal_line[1][0]].max
  return a && b && c && d
end
