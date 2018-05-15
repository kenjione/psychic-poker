require 'psychic_poker/base'

module PsychicPoker
  class Straight < Base
    def check
      potential_combination = find_potential_combination(ACE_HIGH_FACES_ORDER)
      potential_combination = find_potential_combination(HIGH_FIVE_FACES_ORDER) if potential_combination.size < 5

      return false if potential_combination.size < 5

      available_for_swap?(potential_combination)
    end

    private

    def find_potential_combination(faces_order)
      ordered = (hand + deck).sort_by { |card| [faces_order.index(card[0]), deck.index(card).to_i] }
      ordered.each_with_index.with_object([]) do |(current_card, index), stack|
        previous_card = stack[-1]

        break stack                 if stack.size == 5
        next  stack << current_card if previous_card.nil? || next_card?(previous_card, current_card, faces_order)
      end
    end

    def next_card?(previous_card, current_card, faces_order)
      previous_card_index = faces_order.index(previous_card[0])
      current_card_index  = faces_order.index(current_card[0])

      current_card_index - previous_card_index == 1
    end
  end
end
