sequence = []

(2..100).each do |a|
  (2..100).each do |b|
    sequence << a**b
  end
end

puts sequence.uniq.count
