class Summation
  def self.calculate(n, prev = [], result = [])
    (1..n / 2).each do |i|
      result << [i, prev, n - i].flatten
      puts "#{ i }, #{ prev }, #{ n - i }"
      calculate(n - i, [prev, i].flatten, result)
    end
    if n == 1
      p result.map(&:sort).uniq.count
      return
    end
  end
end

Summation.calculate(5)
