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
