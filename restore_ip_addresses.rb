# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
  @cache = {}

  def restore_ip_addresses_helper(s, i)
    return [] if s.length < i || s.length > 3 * i

    if @cache.has_key?(s) && @cache[s].has_key?(i)
      return @cache[s][i]
    end
  
    result = []
    if i == 1
      val = s.to_i
      if s.to_i.to_s == s && val < 256 && val >= 0
        result << s
      end
    else
      (([1, s.length - (i-1) * 3].max)..([3, s.length-(i-1)].min)).each do |j|
        val_str = s[0...j]
        val = s[0...j].to_i
        if val_str.to_i.to_s == val_str && val < 256 && val >= 0
          right_part = restore_ip_addresses_helper(s[j...s.length], i-1)
          right_part.each do |ip_part|
            result << "#{val.to_s}.#{ip_part}"
          end
        end
      end
    end
    if !@cache.has_key?(s)
      @cache[s] = {}
    end
    if !@cache[s].has_key?(i)
      @cache[s][i] = result
    end

    return result
  end

  return restore_ip_addresses_helper(s,4)
end
