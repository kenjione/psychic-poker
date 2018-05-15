require 'psychic_poker/base'

module PsychicPoker
  class Flush < Base
    def check
      suit, potential_combination = find_potential_combination  # searching for potential combination by suit
      return false unless suit || potential_combination         #           and potential_combination number

      available_for_swap?(potential_combination)
    end

    private

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[1] }
        .find     { |suit, cards| cards.size >= 5 }
    end
  end
end
