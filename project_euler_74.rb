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

def factorial(n)
  n <= 0 ? 1 : (1..n).reduce(:*)
end

def generate_chain(n, memo = nil)
  chain_elements = memo || [n]
  new_chain_element = n.to_s.chars.map(&:to_i).inject { |sum, digit| sum + factorial(digit) }
  if chain_elements[0] == new_chain_element
    puts "Chain completed: "
    chain_elements.each { |chain_element| print "#{chain_element} -> " }
    puts new_chain_element
  elsif chain_elements.include?(new_chain_element)
    puts "Chain stuck: "
    chain_elements.each { |chain_element| print "#{chain_element} -> " }
    puts "(#{new_chain_element})"
  else
    chain_elements << new_chain_element
    generate_chain(new_chain_element, chain_elements)
  end
end

generate_chain(69)


