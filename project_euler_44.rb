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
