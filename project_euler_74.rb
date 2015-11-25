# Digit factorial chains
# Problem 74
# The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:
#
# 1! + 4! + 5! = 1 + 24 + 120 = 145
#
# Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:
#
# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872
#
# It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,
#
# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)
#
# Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.
#
# How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?

require 'set'

class ChainsBuilder
  attr_reader :from, :to

  def initialize(from, to)
    @known_chains = Set.new
    @total = 0
    @from, @to = from, to
    precalculate_factorials
  end

  def find_60_terms_chains_count
    (from...to).each do |i|
      p i
      is_chain_known, chain = generate_chain(i)
      if !is_chain_known && chain.count < 60
        @known_chains.merge(chain)
      else
        @total += 1
      end
    end
    @total
  end

  private
  def generate_chain(n, memo = nil)
    chain = memo || [n]
    new_chain_element = n.to_s.chars.map(&:to_i).inject(0) { |sum, digit| sum + @factorials[digit] }
    if @known_chains.include?(new_chain_element)
      [true, []]
    end
    if chain.include?(new_chain_element)
      # puts "Chain stuck: "
      # chain.each { |chain_element| print "#{chain_element} -> " }
      # puts "(#{new_chain_element})"
      [false, chain]
    else
      chain << new_chain_element
      generate_chain(new_chain_element, chain)
    end
  end

  def precalculate_factorials
    @factorials = []
    (0..9).each do |i|
      @factorials[i] = factorial(i)
    end
  end

  def factorial(n)
    n <= 0 ? 1 : (1..n).reduce(:*)
  end
end

p ChainsBuilder.new(1, 1_000_000).find_60_terms_chains_count


