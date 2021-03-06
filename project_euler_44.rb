# Pentagon numbers
# Problem 44
# Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten pentagonal numbers are:
#
# 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
#
# It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 − 22 = 48, is not pentagonal.
#
# Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference are pentagonal and D = |Pk − Pj| is minimised; what is the value of D?

pentagon_nums = []

catch(:done) do
  loop.with_index(1) do |_, n|
    current_pentagon_num =  n * (3 * n - 1) / 2
    pentagon_nums << current_pentagon_num

    pentagon_nums.each_with_index do |pentagon_num, i|
      break if i == pentagon_nums.size - 1
      if pentagon_nums.include?(pentagon_nums.last - pentagon_num)
        d = 1 + 24 * (pentagon_nums.last + pentagon_num)
        if d > 0
          solution_1 = (1 + Math.sqrt(d)) / 6
          solution_2 = (1 - Math.sqrt(d)) / 6

          unless [solution_1, solution_2].select { |s| s > 0 && s % 1 == 0 }.first.nil?
            puts pentagon_nums.last - pentagon_num
            throw(:done)
          end
        end
      end
    end
  end
end
