class Summation
  def self.calculate(n, res = [])
    n.downto(1).each do |i|
      next if i == n
      if i == 1
        p res
      end
      calculate(n - i, res << n)
    end
  end
end

Summation.calculate(5)
