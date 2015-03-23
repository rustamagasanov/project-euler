puts (1..100).inject([]) { |memo, a|
  (a..2_000).each do |b|
    if "#{a}#{b}#{a * b}".chars.sort.join == '123456789'
      memo <<  a * b
    end
  end
  memo
}.uniq.reduce(:+)
