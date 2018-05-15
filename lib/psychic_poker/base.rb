module PsychicPoker
  class Base
    attr_reader :hand, :deck

    ACE_HIGH_FACES_ORDER  = %w[2 3 4 5 6 7 8 9 T J Q K A].freeze
    HIGH_FIVE_FACES_ORDER = %w[A 2 3 4 5 6 7 8 9 T J Q K].freeze

    def initialize(hand, deck)
      @hand = hand
      @deck = deck
    end

    def available_for_swap?(potential_combination)
      potential_deck_cards = deck & potential_combination
      potential_hand_cards = hand & potential_combination

      cards_for_change = hand - potential_hand_cards         # throw away useless cards
      cards_in_deck    = deck.drop(cards_for_change.size)    # pick new cards from the top of the deck
      incoming_cards   = deck - cards_in_deck
      new_hand         = potential_hand_cards + incoming_cards

      return new_hand - potential_combination == [] if potential_combination.size > new_hand.size
      potential_combination - new_hand == []
    end
  end
end
