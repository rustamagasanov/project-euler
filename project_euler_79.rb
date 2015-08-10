# Passcode derivation
# Problem 79
# A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#
# The text file, keylog.txt, contains fifty successful login attempts.
#
# Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

passphrase = ''
codes = File.read('p079_keylog.txt').split("\n")
codes.each do |code|
  # '123456' & '789' = '123456 789'
  if passphrase[code[0]].nil? && passphrase[code[1]].nil? && passphrase[code[2]].nil?
    passphrase += code
    next
  end

  # '123456' & '781' = '781 123456'
  if passphrase[code[0]].nil? && passphrase[code[1]].nil? && !passphrase[code[2]].nil?
    passphrase = code + passphrase
  end

  # else
  #   passphrase.split(code[0])[1]
  #   # if passphrase.split(code[1])[1].nil?
  #   #   passphrase +=
  #   # end
  # end
end
puts passphrase
