# Passcode derivation
# Problem 79
# A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#
# The text file, keylog.txt, contains fifty successful login attempts.
#
# Given that the three characters are always asked for in order, analyse the file so as to determine the shortest possible secret passcode of unknown length.

passphrase = nil
codes = File.read('p079_keylog.txt').split("\n")
codes.each do |code|
  # if code present - skip

  lookup = passphrase
  code.each_char do |char|
    if lookup.nil?
      passphrase = '' if passphrase.nil?
      passphrase += char
    else
      found_index = lookup.index(char)
      if found_index.nil?
        passphrase += char
      else
        lookup = passphrase.split(char)[1]
        # passphrase = "#{passphrase[0..found_index - 1]}#{char}#{passphrase[found_index..-1]}"
      end
    end
  end
end
puts passphrase
