puts (10..100_000).inject { |sum, number|
  if number == number.to_s.chars.map(&:to_i).inject(0) { |memo, n| memo + (1..n).inject(1, :*) }
    sum + number
  else
    sum
  end
}
