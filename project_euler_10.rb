# trial division method
def prime?(num)
  return false if num == 0 || num == 1
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

result = (0..2_000_000).inject do |memo, num|
  if prime?(num)
    puts "memo: #{ memo }; num: #{ num }"
    memo += num
  else
    memo
  end
end

puts "result = #{ result }"
