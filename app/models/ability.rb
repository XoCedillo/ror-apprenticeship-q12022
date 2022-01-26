class Ability < ApplicationRecord
  has_many :ability_pokemons
  has_many :pokemons, through: :ability_pokemons

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :poke_id, presence: true, numericality: { only_integer: true }
end
