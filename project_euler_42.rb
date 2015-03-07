words = File.read('p042_words.txt').gsub('"', '').split(',')
alphabet = ('A'..'Z').to_a

triangulars = []
triangular_max = words.map(&:length).max * (alphabet.size - 1)
loop.with_index do |_, n|
  triangulars <<  1 * n * (n + 1) / 2
  break if n >= triangular_max
end

puts words.select { |word|
 triangulars.include?(word.each_char.map { |c| alphabet.index(c) + 1 }.reduce(:+))
}.count

