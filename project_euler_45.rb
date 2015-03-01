def t(n)
  n * (n + 1) / 2
end

def p(n)
  n * (3 * n - 1) / 2
end

def h(n)
  n * (2 * n - 1)
end

i = 285

p_offset = 0
h_offset = 0

p_found = false
h_found = false

loop do
  i += 1
  triangle = t(i)

  loop do
    pentagonal = p(p_offset)
    if pentagonal > triangle
      break
    elsif pentagonal == triangle
      p_found = true
      break
    else
      p_offset += 1
    end
  end

  loop do
    hexgonal = h(h_offset)
    if hexgonal > triangle
      break
    elsif hexgonal == triangle
      h_found = true
      break
    else
      h_offset += 1
    end
  end

  if p_found && h_found
    puts triangle
    break
  else
    p_found = false
    h_found = false
  end
end
