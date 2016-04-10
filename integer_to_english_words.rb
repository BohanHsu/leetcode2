# @param {Integer} num
# @return {String}
def number_to_words(num)
  return 'Zero' if num == 0
  str = ""
  array = num.to_s.split(//).map do |i|
    i.to_i
  end

  i = array.length - 1

  units = ['', ' Thousand', ' Million', ' Billion']

  while i >= 0 do
    j = [i - 2, 0].max
    part_str = array_to_str(array[j..i])
    if part_str.length == 0
      units.shift
    else
      if str.length == 0
        str = part_str + units.shift
      else
        str = part_str + units.shift + ' ' + str
      end
    end
    i = j - 1
  end

  return str
end

def array_to_str(array)
  dictionary = {
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    4 => 'Four',
    5 => 'Five',
    6 => 'Six',
    7 => 'Seven',
    8 => 'Eight',
    9 => 'Nine',
    10 => 'Ten',
    11 => 'Eleven',
    12 => 'Twelve',
    13 => 'Thirteen',
    14 => 'Fourteen',
    15 => 'Fifteen',
    16 => 'Sixteen',
    17 => 'Seventeen',
    18 => 'Eighteen',
    19 => 'Nineteen',
    20 => 'Twenty',
    30 => 'Thirty',
    40 => 'Forty',
    50 => 'Fifty',
    60 => 'Sixty',
    70 => 'Seventy',
    80 => 'Eighty',
    90 => 'Ninety'
  }

  str = ""
  return str if array.length == 0

  if array.length == 3
    if array[0] != 0
      str += dictionary[array[0]] + ' Hundred'
    end
    array = array[1...3]
  end

  if array.length == 2
    if array[0] != 0
      if str.length > 0
        str += ' '
      end
      if array[0] == 1
        str += dictionary[array[0] * 10 + array[1]]
        return str
      else
        str += dictionary[array[0] * 10]
      end
    end
    array = array[1...2]
  end

  if array.length == 1
    if array[0] != 0
      if str.length > 0
        str += ' '
      end

      str += dictionary[array[0]]
    end
  end

  return str
end
