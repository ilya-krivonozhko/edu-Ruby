# frozen_string_literal: true

require_relative 'character'

class Hero < Character
  attr_reader :amount_of_potions

  def initialize(min_dmg, max_dmg, hit_points, potion_strength, amount_of_potions)
    super(min_dmg, max_dmg, hit_points)
    @potion_strength = potion_strength
    @amount_of_potions = amount_of_potions
  end

  def drink_potion
    return unless @amount_of_potions.positive?

    @amount_of_potions -= 1
    @hit_points += @potion_strength
  end
end
