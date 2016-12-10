# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  return [] if n == 0
  hsh = {1 => ["()"]}
  
  i = 1
  while i < n do
    tmp = {}
    (1..i).each do |j|
      hsh[j].each do |left|
        hsh[i + 1 - j].each do |right|
          str = left + right
          if !tmp.has_key?(str)
            tmp[str] = true
          end
        end
      end
      hsh[i].each do |inner|
        tmp["(" + inner + ")"] = true
      end
    end
    i += 1
    hsh[i] = tmp.keys
  end

  return hsh[n]
end
