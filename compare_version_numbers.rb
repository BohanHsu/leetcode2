# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  v1 = version1.split(".").map {|sub_version| sub_version.to_i}
  v2 = version2.split(".").map {|sub_version| sub_version.to_i}

  i = 0
  max_length = [v1.length, v2.length].max
  while i < max_length do
    va = nil
    vb = nil

    if v1.length <= i
      if v2[i] == 0
        va = 0
        vb = v2[i]
      else
        return -1
      end
    end

    if v2.length <= i
      if v1[i] == 0
        va = v1[i]
        vb = 0
      else
        return 1
      end
    end

    va = v1[i] if va.nil?
    vb = v2[i] if vb.nil?

    if va != vb
      return va - vb > 0 ? 1 : -1
    end
    i += 1
  end
  0
end
