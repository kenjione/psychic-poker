require 'psychic_poker/straight_flush'
require 'psychic_poker/four_of_a_kind'
require 'psychic_poker/full_house'
require 'psychic_poker/flush'
require 'psychic_poker/straight'
require 'psychic_poker/three_of_a_kind'
require 'psychic_poker/two_pairs'
require 'psychic_poker/one_pair'

module PsychicPoker
  class Advisor
    def initialize(hand, deck)
      @hand = hand
      @deck = deck
    end

    def result
      "Hand: #{@hand.join(' ')} Deck: #{@deck.join(' ')} #{find_best_hand}"
    end

    private

    def find_best_hand
      return 'Best hand: straight-flush'  if straight_flush
      return 'Best hand: four-of-a-kind'  if four_of_a_kind
      return 'Best hand: full-house'      if full_house
      return 'Best hand: flush'           if flush
      return 'Best hand: straight'        if straight
      return 'Best hand: three-of-a-kind' if three_of_a_kind
      return 'Best hand: two-pairs'       if two_pairs
      return 'Best hand: one-pair'        if one_pair
      'Best hand: highest-card'
    end

    def straight_flush
      @straight_flush ||= begin
        straight_flush = StraightFlush.new(@hand, @deck)
        straight_flush.check
      end
    end

    def four_of_a_kind
      @four_of_a_kind ||= begin
        four_of_a_kind = FourOfAKind.new(@hand, @deck)
        four_of_a_kind.check
      end
    end

    def full_house
      @full_house ||= begin
        full_house = FullHouse.new(@hand, @deck)
        full_house.check
      end
    end

    def flush
      @flush ||= begin
        flush = Flush.new(@hand, @deck)
        flush.check
      end
    end

    def straight
      @straight ||= begin
        straight = Straight.new(@hand, @deck)
        straight.check
      end
    end

    def three_of_a_kind
      @three_of_a_kind ||= begin
        three_of_a_kind = ThreeOfAKind.new(@hand, @deck)
        three_of_a_kind.check
      end
    end

    def two_pairs
      @two_pairs ||= begin
        two_pairs = TwoPairs.new(@hand, @deck)
        two_pairs.check
      end
    end

    def one_pair
      @one_pair ||= begin
        one_pair = OnePair.new(@hand, @deck)
        one_pair.check
      end
    end
  end
end
