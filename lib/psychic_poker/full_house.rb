require 'psychic_poker/base'

module PsychicPoker
  class FullHouse < Base
    def check
      potential_combination = find_potential_combination.values.flatten
      return false if potential_combination.size < 5

      available_for_swap?(potential_combination)
    end

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[0] }
        .select   { |face, cards| cards.size >= 2 }
    end

    def available_for_swap?(potential_combination)
      potential_deck_cards = deck & potential_combination
      potential_hand_cards = hand & potential_combination

      cards_for_change = hand - potential_hand_cards         # throw away useless cards
      cards_in_deck    = deck.drop(cards_for_change.size)    # pick new cards from the top of the deck
      incoming_cards   = deck - cards_in_deck

      new_hand = potential_hand_cards + incoming_cards
      new_hand.group_by { |card| card[0] }.values.map(&:size).sort == [2, 3] # check that we have pair and three in hand
    end
  end
end
