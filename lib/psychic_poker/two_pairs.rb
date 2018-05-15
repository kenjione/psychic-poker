require 'psychic_poker/base'

module PsychicPoker
  class TwoPairs < Base
    def check
      potential_combination = find_potential_combination
      return false unless potential_combination

      catch :match do
        while potential_combination.any?
          first_pair = potential_combination.shift
          potential_combination.each do |second_pair|
            throw :match, true if available_for_swap?(first_pair + second_pair)
          end
        end
      end
    end

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[0] }
        .select { |suit, cards| cards.size == 2 }
        .values
    end
  end
end
