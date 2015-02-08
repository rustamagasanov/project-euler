class AmicableNumbers
  def find_till(n)
    (2..n).inject([]) do |memo, i|
      next memo if memo.include?(i)
      a = d(i)
      if a != i
        b = d(a)
        memo << a << b if i == b
      end
      memo
    end.uniq
  end

  private
  def d(n)
    Factors.find(n)[0..-2].reduce(:+)
  end
end

module Factors
  extend self

  def find(n)
    return [1] if n == 1
    (2..n).to_a.inject([1, n]) do |factors, i|
      break factors if factors.include?(i)
      (n % i == 0) ? (factors << i << n / i) : factors
    end.sort
  end
end

puts AmicableNumbers.new.find_till(10000).reduce(:+)
