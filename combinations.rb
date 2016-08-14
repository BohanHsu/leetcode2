# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  return [] if k == 0
  i = 1
  combines = (1..(n - k + 1)).map {|j| [j]}

  while i < k do
    new_combines = []
    combines.each do |comb|
      ((comb[-1]+1)..(n - (k - comb.length) + 1)).each do |j|
        new_combines << comb + [j]
      end
    end
  
    i += 1
    combines = new_combines
  end

  combines
end
