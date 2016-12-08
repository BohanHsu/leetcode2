# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?
  tree = {}
  insert_tree(tree, strs[0])
  len = strs.map do |str|
    insert_tree(tree, str)
  end.min
  return strs[0][0...len]
end

# @return integer
def insert_tree(tree, str)
  common = 0
  node = tree
  str.chars.each_with_index do |chr, i|
    if node.has_key?(chr)
      common += 1
    else
      node[chr] = {}
    end
    node = node[chr]
  end
  return common
end
