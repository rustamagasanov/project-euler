# Concealed Square
# Problem 206
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

min = 1020304050607080900
max = 1929394959697989990

loop.with_index(Math.sqrt(min).to_i) do |_, i|
  current_try = i * i
  p current_try
  if current_try.to_s =~ /1\d2\d3\d4\d5\d6\d7\d8\d9\d0/
    puts "#{i} * #{i} = #{current_try}"
  end
  break if current_try > max
end

