require 'psychic_poker/version'
require 'psychic_poker/advisor'

module PsychicPoker
  module_function

  def search(input)
    hand, deck = input.scan(/.{1,15}/).map { |list| list.split(' ') }
    return 'Not enough cards' if hand&.size != 5 && deck&.size != 5

    advisor = Advisor.new(hand, deck)
    advisor.result
  end
end
