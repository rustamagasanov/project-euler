# 9! * 6 = 2_177_280 : maximum sum of factorials for 6-digit number = 7-digit number,
# thus it is possible to find an answer in range 1..999_999
# 9! * 7 = 2_540_160 : maximum sum of factorials for 7-digit number = 7-digit number,
# thus correct upper bound is 2_540_160
puts (10..2_540_160).inject { |sum, number|
  if number == number.to_s.chars.map(&:to_i).inject(0) { |memo, n| memo + (1..n).inject(1, :*) }
    sum + number
  else
    sum
  end
}
