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

# Solution method: http://math.stackexchange.com/questions/8308/working-with-large-exponents
# Since logarithms are monotonically increasing, you can determine if
# a^b>c^d
# by instead checking if
# log(a^b)>log(c^d)
# which can be rewritten (using basic properties of logarithms) as
# b*log(a)>d*log(c)

file_content = File.read('project_euler_99_base_exp.txt').split("\n")

bases, exponents = [], []
file_content.map do |f|
  line = f.split(',')
  bases     << line[0]
  exponents << line[1]
end

