names = File.read('project_euler_22.txt').gsub('"', '').split(',').sort

alphabet = ('A'..'Z').to_a

puts names.inject(0) { |total_score, name|
  chars_score = name.each_char.inject(0) do |char_score, char|
    char_score + alphabet.index(char) + 1
  end
  total_score + chars_score * (names.index(name) + 1)
}
