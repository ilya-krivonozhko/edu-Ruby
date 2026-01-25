# frozen_string_literal: true

class Character
  attr_reader :hit_points, :min_dmg, :max_dmg

  def initialize(min_dmg, max_dmg, hit_points)
    @min_dmg = min_dmg
    @max_dmg = max_dmg
    @hit_points = hit_points
  end

  def attack(target)
    return unless self.class != target.class

    damage = rand(@min_dmg..@max_dmg)
    target.receive_damage damage
    after_attack
    damage
  end

  protected

  def receive_damage(damage)
    @hit_points -= damage
  end

  def after_attack; end
end
