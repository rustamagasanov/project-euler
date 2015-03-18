puts (1..10_000).inject(10_000) { |sum, n|
  num = n + n.to_s.reverse.to_i
  49.times do
    if num.to_s == num.to_s.reverse
      sum -= 1
      break
    else
      num = num + num.to_s.reverse.to_i
    end
  end
  sum
}
