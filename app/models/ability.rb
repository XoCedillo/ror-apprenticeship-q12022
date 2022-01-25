class Ability < ApplicationRecord
  has_many :ability_pokemons
  has_many :pokemons, through: :ability_pokemons
end
