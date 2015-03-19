def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n).round).each { |i| return false if n % i == 0 }
  true
end

catch(:done) do
  loop.with_index(2) do |_, i|
    next if i.even? || prime?(i)
    loop.with_index(1) do |_, y|
      if 2 * y > i
        puts i
        throw(:done)
      end
      break if prime?(i - 2 * y**2)
    end
  end
end
