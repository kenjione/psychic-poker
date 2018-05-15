require 'psychic_poker/base'

module PsychicPoker
  class StraightFlush < Base
    def check
      suit, potential_combination = find_potential_combination           # searching for potential combination by suit
      return false unless suit || potential_combination                  #           and potential_combination number

      faces = ordered_faces(potential_combination)                       # order faces of potential combination
      return false unless ACE_HIGH_FACES_ORDER.join.include?(faces.join) # checking potential combination in correct order

      available_for_swap?(potential_combination)
    end

    private

    def find_potential_combination
      (hand + deck)
        .group_by { |card| card[1] }
        .find     { |suit, cards| cards.size >= 5 }
    end

    def ordered_faces(potential_combination)
      potential_combination
        .map     { |card| card[0] }
        .sort_by { |face| ACE_HIGH_FACES_ORDER.index(face) }
    end
  end
end
