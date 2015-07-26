# Concealed Square
# Problem 206
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

# approach 1
(0..999_999_999).each do |i|
  p i
  s = i.to_s.rjust(9, '0')
  num = "1#{s[0]}2#{s[1]}3#{s[2]}4#{s[3]}5#{s[4]}6#{s[5]}7#{s[6]}8#{s[7]}9#{s[8]}0"
  if Math.sqrt(num.to_i) % 1 == 0.0
    puts num
    break
  end
end

# approach 2
# get squares above 1_0_0_0_0_0_0_0_0_0
#             below 1_2_3_4_5_6_7_8_9_1
