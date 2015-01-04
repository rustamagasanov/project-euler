puts (1...1000).to_a.inject { |sum, n| (n % 3 == 0 || n % 5 == 0) ? sum + n : sum }
