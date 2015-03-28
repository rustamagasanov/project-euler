pentagon_nums = []
sums  = []
pairs = []

loop.with_index(1) do |_, n|
  current_pentagon_num =  n * (3 * n - 1) / 2
  pentagon_nums << current_pentagon_num

  if sums.detect { |sum| sum == current_pentagon_num }
    index = sums.find_index(current_pentagon_num)
    puts pairs[index][0] - pairs[index][1]
    break
  end

  pentagon_nums.each_with_index do |pentagon_num, i|
    break if i == pentagon_nums.size - 1

    if pentagon_nums.include?(pentagon_nums.last - pentagon_num)
      sums  << pentagon_nums.last + pentagon_num
      pairs << [pentagon_nums.last, pentagon_num]
    end
  end
end
