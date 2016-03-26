# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  bulls = 0
  cows = 0
  secret = secret.chars
  guess = guess.chars
  secret_map = 10.times.map { 0 }
  guess_map = 10.times.map { 0 }

  secret.each_with_index do |chr, idx|
    if chr == guess[idx]
      bulls += 1
      secret[idx] = nil
      guess[idx] = nil
    end
  end

  secret.each do |chr|
    secret_map[chr.ord - 48] += 1 if !chr.nil?
  end

  guess.each do |chr|
    guess_map[chr.ord - 48] += 1 if !chr.nil?
  end

  10.times do |i|
    cows += [secret_map[i], guess_map[i]].min
  end
  
  return "#{bulls}A#{cows}B"
end
