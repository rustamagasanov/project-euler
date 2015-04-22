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
