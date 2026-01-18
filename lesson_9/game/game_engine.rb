# frozen_string_literal: true

require 'yaml'
require_relative 'hero'
require_relative 'dragon'

class GameEngine
  def initialize
    character_settings = get_difficulty_settings
    @hero = Hero.new character_settings[:hero][:min_dmg],
                     character_settings[:hero][:max_dmg],
                     character_settings[:hero][:hit_points],
                     character_settings[:hero][:potion_strength],
                     character_settings[:hero][:amount_of_potions]
    @dragon = Dragon.new character_settings[:dragon][:min_dmg],
                         character_settings[:dragon][:max_dmg],
                         character_settings[:dragon][:hit_points]
  end

  def run
    hero_turn = true
    loop do
      puts "Hero's health: #{@hero.hit_points}\nDragon's health: #{@dragon.hit_points}\n\n"
      if hero_turn
        do_hero_turn
      else
        puts "Dragon moves!\nDragon hit for #{@dragon.attack(@hero)} HP"
      end

      if @dragon.hit_points <= 0
        puts 'Hero has won!'
        break
      end
      if @hero.hit_points <= 0
        puts 'Dragon has won!'
        break
      end

      hero_turn = !hero_turn
    end
  end

  private

  def get_difficulty_settings(filename = 'settings.yml')
    level_map = {
      'H' => :hard,
      'M' => :medium,
      'E' => :easy
    }
    settings = YAML.safe_load_file(filename, symbolize_names: true)
    loop do
      puts 'Select the difficulty level of the game (E - easy, M - medium, H - hard):'
      input = gets.strip[0].upcase
      return settings[level_map[input]] if level_map.key?(input)

      puts "Incorrect input. You must enter only one of these letters: E, M, H\n\n"
    end
  end

  def do_hero_turn
    puts "Hero moves!\nYou have #{@hero.amount_of_potions} potions\nWhat do we do? Enter P for potion or A for attack"
    loop do
      input = gets.strip[0].upcase
      if %w[P A].include?(input)
        if input == 'P'
          @hero.drink_potion
          break
        elsif input == 'A'
          puts "Hero hit for #{@hero.attack(@dragon)} HP"
          break
        end
      end
    end
  end
end
