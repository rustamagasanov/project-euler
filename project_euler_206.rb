# Concealed Square
# Problem 206
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

min = 1020304050607080900
max = 1929394959697989990

i = Math.sqrt(min).to_i
loop do
  # i should be ...0 to match ...0 square
  if i % 10 != 0
    i += 1
    next
  end
  current_try = i * i
  current_try_s = current_try.to_s
  if current_try_s =~ /^\d{2}3\d{16}/
    # 103xxxxxxxxxxxxxxxx, 113xxxxxxxxxxxxxxxx, ... -> 112xxxxxxxxxxxxxxxx, 122xxxxxxxxxxxxxxxx, ...
    increment = current_try_s[0..1].to_i + 1
    i = Math.sqrt("#{increment}20304050607080900".to_i).to_i
  elsif current_try_s =~ /^\d{4}4\d{14}/
    # 10204xxxxxxxxxxxxxx, 10214xxxxxxxxxxxxxx, ... -> 10213xxxxxxxxxxxxxx, 10223xxxxxxxxxxxxxx, ...
    increment = current_try_s[0..3].to_i + 1
    i = Math.sqrt("#{increment}304050607080900".to_i).to_i
  elsif current_try_s =~ /^\d{6}5\d{12}/
    # 1020305xxxxxxxxxxxx, 1020315xxxxxxxxxxxx, ... -> 1020314xxxxxxxxxxxx, 1020324xxxxxxxxxxxx, ...
    increment = current_try_s[0..5].to_i + 1
    i = Math.sqrt("#{increment}4050607080900".to_i).to_i
  elsif current_try_s =~ /^\d{8}6\d{10}/
    # etc
    increment = current_try_s[0..7].to_i + 1
    i = Math.sqrt("#{increment}50607080900".to_i).to_i
  elsif current_try_s =~ /^1\d2\d3\d4\d5\d6\d7\d8\d9\d0/
    puts "#{i} * #{i} = #{current_try}"
    break
  else
    i += 1
  end
  break if current_try > max
end

