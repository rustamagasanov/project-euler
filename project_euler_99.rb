# Largest exponential
# Problem 99
#
# Comparing two numbers written in index form like 2^11 and 3^7 is not difficult, as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
#
# However, confirming that 632382^518061 > 519432^525806 would be much more difficult, as both numbers contain over three million digits.
#
# Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.
#
# NOTE: The first two lines in the file represent the numbers in the example given above.


file_content = File.read('project_euler_99_base_exp.txt').split("\n")

bases, exponents = [], []
file_content.map do |f|
  line = f.split(',')
  bases     << line[0]
  exponents << line[1]
end

acc = []
exs = []
bases.each do |b|
  if b.size == 6
    exs << exponents[bases.index(b)]
  end
end
exs.sort.each do |e|
  puts "#{bases[exponents.index(e)]}-#{e}"
end

p file_content.index("100006,601055")
# p exponents.index(exponents.max)
# p bases[exponents.index(exponents.max)]
