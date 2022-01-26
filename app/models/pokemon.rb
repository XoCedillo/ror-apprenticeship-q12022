class Pokemon < ApplicationRecord
  has_many :ability_pokemons
  has_many :abilities, through: :ability_pokemons

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :poke_id, presence: true, numericality: { only_integer: true }
end
