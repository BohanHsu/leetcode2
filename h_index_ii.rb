# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  citations.each_with_index do |citation, i|
    if citation >= citations.length - i
      return citations.length - i
    end
  end

  0
end
