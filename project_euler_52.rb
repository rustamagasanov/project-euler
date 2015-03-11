loop.with_index do |_, i|
  next if i < 10

  i_chars = i.to_s.chars.sort

  if (6 * i).to_s.chars.sort == i_chars &&
     (5 * i).to_s.chars.sort == i_chars &&
     (4 * i).to_s.chars.sort == i_chars &&
     (3 * i).to_s.chars.sort == i_chars &&
     (2 * i).to_s.chars.sort == i_chars
    puts i
    break
  end
end
