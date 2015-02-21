def prime?(num)
  return false if num == 0 || num == 1
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

puts (0..999_999).inject([]) { |memo, num|
  next memo if memo.include?(num)
  digits = num.to_s.chars

  rotations = (1..digits.size).inject([]) do |r, i|
    r << digits.rotate(i).join('').to_i
  end

  if rotations.all? { |i| prime?(i) }
    memo += rotations.uniq
  end
  memo
}.size
