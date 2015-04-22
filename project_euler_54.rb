# Poker hands
# Problem 54
# In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
#
# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
#
# If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.
#
# Consider the following five hands dealt to two players:
#
# Hand    Player 1    Player 2    Winner
# 1   5H 5C 6S 7S KD
# Pair of Fives
#   2C 3S 8S 8D TD
# Pair of Eights
#   Player 2
# 2   5D 8C 9S JS AC
# Highest card Ace
#   2C 5C 7D 8S QH
# Highest card Queen
#   Player 1
# 3   2D 9C AS AH AC
# Three Aces
#   3D 6D 7D TD QD
# Flush with Diamonds
#   Player 2
# 4   4D 6S 9H QH QC
# Pair of Queens
# Highest card Nine
#   3D 6D 7H QD QS
# Pair of Queens
# Highest card Seven
#   Player 1
# 5   2H 2D 4C 4D 4S
# Full House
# With Three Fours
#   3C 3D 3S 9S 9D
# Full House
# with Three Threes
#   Player 1
# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.
#
# How many hands does Player 1 win?

class PokerHand
  def self.analyze(hand)
    values = hand.map { |i| i[0] }
    suits  = hand.map { |i| i[1] }

    seq = %w(2 3 4 5 6 7 8 9 T J Q K A)

    values_seq    = values.map { |i| seq.index(i) }.sort
    values_slices = values_seq.slice_when { |a, b| a != b }.to_a

    case
      when suits.uniq.size == 1 && values - %w(T J Q K A) == []
        { rank: 10, name: 'Royal Flush' }
      when suits.uniq.size == 1 && (values_seq.each_cons(2).all? { |a, b| b == a + 1 } || values_seq == [0, 1, 2, 3, 12])
        { rank: 9, name: 'Straight Flush',
          seq: [values_seq[-1] == 12 ? 3 : values_seq[-1]] }
      when values_slices.detect { |s| s.size == 4 }
        { rank: 8, name: 'Four of a Kind',
          seq: [values_slices.detect { |s| s.size == 4 }[0], values_slices.detect { |s| s.size == 1 }[0]] }
      when values_slices.size == 2
        { rank: 7, name: 'Full House',
          seq: [values_slices.detect { |s| s.size == 3 }[0], values_slices.detect { |s| s.size == 2 }[0]] }
      when suits.uniq.size == 1
        { rank: 6, name: 'Flush',
          seq: values_seq.reverse }
      when values_seq.each_cons(2).all? { |a, b| b == a + 1 } || values_seq == [0, 1, 2, 3, 12]
        { rank: 5, name: 'Straight',
          seq: [values_seq[-1] == 12 ? 3 : values_seq[-1]] }
      when values_slices.detect { |s| s.size == 3 }
        { rank: 4, name: 'Three of a Kind',
          seq: [values_slices.detect { |s| s.size == 3 }[0], *values_slices.select { |s| s.size == 1 }.map(&:first).reverse] }
      when values_slices.size == 3
        { rank: 3, name: 'Two Pairs',
          seq: values_slices.select { |i| i.size == 2 }.map(&:first).reverse + values_slices.select { |i| i.size == 1 }[0] }
      when values_slices.size == 4
        { rank: 2, name: 'One Pair',
          seq: [values_slices.detect { |i| i.size == 2 }[0]] + values_slices.select { |s| s.size == 1 }.map(&:first).reverse }
      else
        { rank: 1, name: 'High Card',
          seq: values_seq.reverse }
    end
  end
end

rounds = File.read('p054_poker.txt').split("\n")
puts rounds.inject(0) { |memo, hands|
  p1_hand = hands[0..13].split
  p2_hand = hands[15..-1].split

  p1_hand_analyzed = PokerHand.analyze(p1_hand)
  p2_hand_analyzed = PokerHand.analyze(p2_hand)

  if p1_hand_analyzed[:rank] > p2_hand_analyzed[:rank]
    memo += 1
  elsif p1_hand_analyzed[:rank] == p2_hand_analyzed[:rank]
    (0..p1_hand_analyzed[:seq].size - 1).each do |i|
      if p1_hand_analyzed[:seq][i] > p2_hand_analyzed[:seq][i]
        memo += 1
        break
      elsif  p1_hand_analyzed[:seq][i] == p2_hand_analyzed[:seq][i]
      else
        break
      end
    end
  end
  memo
}
