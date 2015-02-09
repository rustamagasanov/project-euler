names = File.read('project_euler_22.txt').gsub('"', '').split(',').sort

alphabet = ('A'..'Z').to_a

puts names.each_with_index.inject(0) { |total_score, pair|
  name, index = pair
  total_score + name.each_char.inject(0) do |char_score, char|
    char_score + alphabet.index(char) + 1
  end * index
}
