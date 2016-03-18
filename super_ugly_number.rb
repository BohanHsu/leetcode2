# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
  uglys = [1]
  explore_boundry = -1
  last_mutipled_idx = primes.map {-1}

  while uglys.length < n do
    min_ugly = Float::INFINITY
    (0..([(primes.length - 1), (explore_boundry + 1)].min)).each do |i|
      prime = primes[i]
      cur_ugly = uglys[last_mutipled_idx[i] + 1] * prime
      if  cur_ugly < min_ugly
        min_ugly = cur_ugly
      end
      #primes.each_with_index do |prime, idx|
      #  cur_ugly = uglys[last_mutipled_idx[idx] + 1] * prime
      #  if  cur_ugly < min_ugly
      #    min_ugly = cur_ugly
      #  end
      #end
    end

    (0..([(primes.length - 1), (explore_boundry + 1)].min)).each do |i|
      prime = primes[i]
      if uglys[last_mutipled_idx[i] + 1] * prime == min_ugly
        last_mutipled_idx[i] += 1
        if i == explore_boundry + 1
          explore_boundry += 1
        end
      end
    end
    uglys << min_ugly
  end
  uglys.last
end
