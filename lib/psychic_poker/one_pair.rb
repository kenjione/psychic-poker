require 'psychic_poker/base'

module PsychicPoker
  class OnePair < Base
    def check
      potential_combination = find_potential_combination
      return false unless potential_combination

      while potential_combination.any?
        first_pair = potential_combination.shift
        break true if available_for_swap?(first_pair)
      end
    end

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[0] }
        .select { |_suit, cards| cards.size == 2 }
        .values
    end
  end
end
