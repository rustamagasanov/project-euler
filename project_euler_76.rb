class Summation
  def self.calculate(n, prev = [], ways = 0)
    return if n == 1
    (1..n / 2).each do |i|
      ways += 1
      puts "#{ i }, #{ prev } & #{ n - i }"
      calculate(n - i, [prev, i].flatten, ways)
    end
  end
end

Summation.calculate(5)
