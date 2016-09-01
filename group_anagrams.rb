# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  hsh = {}
  strs.each do |str|
    k = re_order(str)
    if !hsh.has_key?(k)
      hsh[k] = []
    end
    hsh[k] << str
  end

  return hsh.values
end

def re_order(str)
  hsh = {}
  extra_chars = []

  str.chars.each do |chr|
    if !hsh.has_key?(chr)
      hsh[chr] = 0
    end
    hsh[chr] += 1
    if !("a".."z").include?(chr) && !("A".."Z").include?(chr)
      extra_chars << chr
    end
  end

  buffer = []
  ("a".."z").each do |chr|
    if hsh.has_key?(chr)
      hsh[chr].times do
        buffer << chr
      end
    end
  end

  ("A".."Z").each do |chr|
    if hsh.has_key?(chr)
      hsh[chr].times do
        buffer << chr
      end
    end
  end

  extra_chars.sort do |a, b|
    a.ord - b.ord
  end

  extra_chars.each do |chr|
    if hsh.has_key?(chr)
      hsh[chr].times do
        buffer << chr
      end
    end
  end

  return buffer.join("")
end
