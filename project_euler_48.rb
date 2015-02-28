puts (1..1000).inject(0) { |memo, i| memo += i**i; memo }.to_s[-10..-1]

