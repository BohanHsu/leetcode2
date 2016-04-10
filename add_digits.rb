# @param {Integer} num
# @return {Integer}
def add_digits(num)
  while num > 9
    num = num.to_s.split(//).map(&:to_i).inject(0) do |memo, obj|
      memo + obj
    end
  end

  num
end
