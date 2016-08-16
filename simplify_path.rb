# @param {String} path
# @return {String}
def simplify_path(path)
  return "" if path.length == 0
  is_absolute_path = (path[0] == '/')
  path_array = path.split(/\//)
  path_array.shift if is_absolute_path
  stack = []

  path_array.each do |part|
    if part == '..'
      stack.pop
    else
      if part != '.' && part != ""
        stack << part
      end
    end
  end
  str = stack.join('/')
  return (is_absolute_path ? '/' : '') + str
end
