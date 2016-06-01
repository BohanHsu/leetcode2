# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  return [] if s.length <= 10
  repeated = []

  chrs = s.chars
  mask = 2 ** 20 - 1
  dict = {'A' => 0, 'T' => 1, 'C' => 2, 'G' => 3}
  reverse_dict = {}
  dict.each do |k, v|
    reverse_dict[v] = k
  end

  num = encrypt(chrs, mask, dict, reverse_dict)
  hsh = {num => 1}

  (10...chrs.length).each do |i|
    num = shift_left(chrs[i], num, mask, dict)
    if !hsh.has_key?(num)
      hsh[num] = 0
    end
    hsh[num] += 1

    if hsh.has_key?(num) && hsh[num] == 2
      repeated << num
    end
  end

  repeated.map! do |num|
    decrypt(num, mask, dict, reverse_dict)
  end
  repeated
end

def shift_left(chr, num, mask, dict)
  (num * 4 + dict[chr]) & mask
end

def encrypt(chrs, mask, dict, reverse_dict)
  num = 0
  10.times do |i|
    num *= 4
    num += dict[chrs[i]]
    num &= mask
  end
  num &= mask
  num
end

def decrypt(num, mask, dict, reverse_dict)
  buffer = []
  10.times do |j|
    buffer << reverse_dict[num & 3]
    num  /= 4
  end
  buffer.reverse.join("")
end
