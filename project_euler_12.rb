def foo(number)
  [2, 3, 4, 5].each do |i|
    return true if number % i != 0
  end
  false
end

def get_factors(number)
  factors = [1, number]
  num_to_check = 2
  complete_flag = number == 1 || foo(number)

  while !complete_flag
    # puts "num to check: #{num_to_check }"
    # puts "factors: #{factors}"
    if number % num_to_check == 0
      factors << num_to_check
      factors << number / num_to_check
    end
    num_to_check += 1
    complete_flag = factors.include?(num_to_check)
  end
  factors.sort
end

triangle_number = 0
next_digit = 1
complete_flag = false

while !complete_flag do
  triangle_number += next_digit
  next_digit += 1

  factors = get_factors(triangle_number)
  puts "number: #{ triangle_number } factors: #{ factors.count }" if factors.count > 2 #(#{ factors })"

  if factors.count >= 500
    complete_flag = true
  end
end
