puts (10..354_294).inject(0) { |sum, number|
  if number == number.to_s.chars.map(&:to_i).inject(0) { |memo, n| memo += n**5 }
    sum + number
  else
    sum
  end
}
