# @param {String} s
# @return {Boolean}
def is_number(s)
  return is_number_helper(s, 0, nil, nil)
end

def is_number_helper(s, i, last_symb, cur_symb)
  #puts "s[i]=#{s[i]}, i=#{i}, last_symb=#{last_symb}, cur_symb=#{cur_symb}"

  if i == 0
    cur_symb = nil
    valid_start().each do |symb|
      if maps()[symb].include?(s[i])
        cur_symb = symb
      end
    end

    if cur_symb.nil?
      return false
    end
  end

  if i == s.length - 1
    return valid_end().include?(cur_symb)
  end

  next_symb = nil
  return false if !nextsymb().has_key?(cur_symb)

  nextsymb()[cur_symb].each do |symb|
    if maps()[symb].include?(s[i+1])
      next_symb = symb
    end
  end
  #puts "next_symb=#{next_symb}"

  return false if next_symb.nil?
  return is_number_helper(s, i+1, cur_symb, next_symb)
end

def maps()
  return {
    :space1 => [" "],
    :space2 => [" "],
    :digit1 => (10.times.map {|num| num.to_s}),
    :digit2 => (10.times.map {|num| num.to_s}),
    :digit3 => (10.times.map {|num| num.to_s}),
    :e => ["e"],
    :dot1 => ["."],
    :dot2 => ["."],
    :sign1 => ["+", "-"],
    :sign2 => ["+", "-"]
  }
end

def nextsymb()
  return {
    :space1 => [:digit1, :space1, :dot1, :sign1],
    :digit1 => [:digit1, :e, :dot2, :space2],
    :e => [:digit3, :sign2],
    :dot1 => [:digit2],
    :dot2 => [:digit2, :space2, :e],
    :digit2 => [:digit2, :space2, :e],
    :digit3 => [:digit3, :space2],
    :space2 => [:space2],
    :sign1 => [:digit1, :dot1],
    :sign2 => [:digit3]
  }
end

def valid_start()
  return [:space1, :digit1, :dot1, :sign1]
end

def valid_end()
  return [:digit1, :dot2, :digit2, :space2, :digit3]
end

#              
#
#         
#         
#        
#         
#                                                                |----------------------------------------|
#                                                                |                                        |
#                                       -------------------------|----------------------------------------|
#                                       |                        |       |                                |
#                     ------------------+----->[*dot1] -------   |       |                                |
#                     |                 |                    |   |       |                                |
#                     |                 |                    |   |       |                                |
#                     |                 +--->  [dot2*] ------+   |       |                                |
#                     |                 |                    |   |       |                                |
#                     |                 |                    v   |       v                                v
#    [*space1]------*sign1----->*digit1*-                 digit2*------>-e --->sign2---->digit3*---->[space2*]-
#         ^   |                     ^   |                    ^   |                          ^   |         ^   |
#         |   |                     |   |                    |   |                          |   |         |   |
#         ----|                     ----|                    ----|                          ----|         ----|
#
