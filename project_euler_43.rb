puts (0..9).to_a.permutation(10).inject(0) { |sum, permutation|
  s = permutation.join
  if(s[1..3].to_i % 2 == 0 && s[2..4].to_i % 3 == 0 &&
     s[3..5].to_i % 5 == 0 && s[4..6].to_i % 7 == 0 &&
     s[5..7].to_i % 11 == 0 && s[6..8].to_i % 13 == 0 &&
     s[7..9].to_i % 17 == 0)
    sum + s.to_i
  else
    sum
  end
}
