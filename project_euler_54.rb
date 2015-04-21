class PokerHand
  def self.analyze(hand)
    values = hand.map { |i| i[0] }
    suits  = hand.map { |i| i[1] }

    seq = %w(2 3 4 5 6 7 8 9 T J Q K A)

    values_seq    = values.map { |i| seq.index(i) }.sort
    values_slices = values_seq.slice_when { |a, b| a != b }.to_a

    p values_slices.detect { |s| s.size == 3 }
    p values_slices - [values_slices.detect { |s| s.size == 3 }]

    case
      # Royal Flush
      when suits.uniq.size == 1 && values - %w(T J Q K A) == []
        { rank: 10 }
      # Straight Flush
      when suits.uniq.size == 1 && (values_seq.each_cons(2).all? { |a, b| b == a + 1 } || values_seq == [0, 1, 2, 3, 12])
        { rank: 9, highest: values_seq[-1] == 12 ? 3 : values_seq[-1] }
      # Four of a Kind
      when values_slices.detect { |s| s.size == 4 }
        { rank: 8, highest: values_slices.detect { |s| s.size == 4 }[0] }
      # Full House
      # when

      else
        raise 'Unknown hand'
    end
  end
end

# p1_hand = %w(6C QC 9S KD JC)
# p1_hand = %w(5H 5C 6S 7S KD)
# p1_hand = %w(TH JH QH KH AH)
# p1_hand = %w(3H 4H 5H 6H 7H)
# p1_hand = %w(AH 2H 3H 4H 5H)
# p1_hand = %w(AH AH AH AH 5H)
p1_hand = %w(AH AH AH JH JC)
p PokerHand.analyze(p1_hand)
