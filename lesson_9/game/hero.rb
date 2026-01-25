# frozen_string_literal: true

require_relative 'character'

class Hero < Character
  attr_reader :amount_of_potions

  def initialize(min_dmg, max_dmg, hit_points, potion_strength, amount_of_potions)
    super(min_dmg, max_dmg, hit_points)
    @potion_strength = potion_strength
    @amount_of_potions = amount_of_potions
    @drunk_potion = false
  end

  def min_dmg
    @drunk_potion ? 0 : self.class.min_dmg
  end

  def drink_potion
    return unless @amount_of_potions.positive?

    @amount_of_potions -= 1
    @hit_points += @potion_strength
    @drunk_potion = true
  end

  protected

  def after_attack
    @drunk_potion = false if @drunk_potion
  end
end
