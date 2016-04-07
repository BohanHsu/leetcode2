# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  is_bad_cache = {}

  from = 1
  to = n + 1

  mid = (from + to) / 2

  while !is_first_bad_version?(mid, is_bad_cache) do
    search_direction = get_check_direction(mid, is_bad_cache)
    if search_direction == :search_right
      from = mid
    elsif search_direction == :search_left
      to = mid
    end

    mid = (from + to) / 2
  end

  return mid
end

def get_check_direction(version, is_bad_cache)
  if !check_is_bad_version?(is_bad_cache, version-1) && !check_is_bad_version?(is_bad_cache, version)
    return :search_right
  elsif check_is_bad_version?(is_bad_cache, version-1) && check_is_bad_version?(is_bad_cache, version)
    return :search_left
  end
end

def is_first_bad_version?(version, is_bad_cache)
  return version == 1 && check_is_bad_version?(is_bad_cache, version) || !check_is_bad_version?(is_bad_cache, version-1) && check_is_bad_version?(is_bad_cache, version)
end

def check_is_bad_version?(is_bad_cache, version)
  if !is_bad_cache.has_key?(version)
    is_bad_cache[version] = is_bad_version(version)
  end
  return is_bad_cache[version]
end
