# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  return 0 if citations.empty?
  from = 0
  to = citations.length
  mid = (from + to) / 2

  count = 0
  last_mid = nil
  while !check_h_index(mid, citations) do
    return if count > 10

    direction = get_direction(mid, citations)

    if direction == :move_to
      to = mid
    elsif direction == :move_from
      from = mid
    else
      return 0
    end
    if (from + to) / 2 == last_mid
      return 0
    end

    last_mid = mid
    mid = (from + to) / 2
  end

  citations.length - mid
end

def get_direction(idx, citations)
  if idx == 0
    return nil
  else
    if citations[idx - 1] >= citations.length - idx + 1 && citations[idx] >= citations.length - idx
      return :move_to
    elsif citations[idx - 1] < citations.length - idx + 1 && citations[idx] < citations.length - idx
      return :move_from
    end
  end
  nil
end

def check_h_index(idx, citations)
  idx == 0 && citations[0] >= citations.length || citations[idx - 1] < citations.length - idx + 1 && citations[idx] >= citations.length - idx
end

