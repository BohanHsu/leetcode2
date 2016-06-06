# @param {Integer} n
# @return {String}
def convert_to_title(n)
  str = ""
  while n > 0 do
    if (n % 26) == 0
      chr = "Z"
    else
      chr = ("A".ord + (n % 26) - 1).chr
    end

    n = (n - (n % 26 == 0 ? 26 : n % 26)) / 26
    str = chr + str
  end
  str
end
