# Passcode derivation
# Problem 79
# A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#
# The text file, keylog.txt, contains fifty successful login attempts.
#
# Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

passphrase = ''
codes = File.read('p079_keylog.txt').split("\n").uniq

# 73162890
loop do
  # selecting character based on appearance count on 1st place in code
  char = codes.each_with_object(Hash.new(0)) { |code, o| o[code[0]] += 1 }.max_by { |k,v| v }[0]

  passphrase << char

  # removing corresponding character from all codes
  codes.each_with_index do |value, index|
    if value[0] == char
      codes[index] = value[1..-1]
    end
  end

  # remove blank codes from array
  codes.delete_if { |el| el == '' }

  break if codes.size == 0
end

puts passphrase
