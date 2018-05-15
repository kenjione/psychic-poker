require 'psychic_poker/base'

module PsychicPoker
  class FourOfAKind < Base
    def check
      suit, potential_combination = find_potential_combination
      return false unless suit || potential_combination

      available_for_swap?(potential_combination)
    end

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[0] }
        .find { |suit, cards| cards.size == 4 }
    end
  end
end
