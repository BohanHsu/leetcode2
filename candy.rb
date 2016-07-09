# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  candies = ratings.map {|rating| nil}
  i = 0

  while i < ratings.length do
    if candies[i].nil?
      candy_of_index(i, ratings, candies)
    end
    i += 1
  end

  return candies.inject(0) do |memo, obj|
    memo + obj
  end
end

def candy_of_index(i, ratings, candies)
  dependencies = []
  if i > 0
    if ratings[i-1] < ratings[i]
      if candies[i-1].nil?
        candy_of_index(i-1, ratings, candies)
      end
      dependencies << candies[i-1]
    end
  end
  if i < ratings.length - 1
    if ratings[i+1] < ratings[i]
      if candies[i+1].nil?
        candy_of_index(i+1, ratings, candies)
      end
      dependencies << candies[i+1]
    end
  end
  candies[i] = dependencies.empty? ? 1 : dependencies.max + 1
  #puts "i=#{i}, candies=#{candies}"
end
