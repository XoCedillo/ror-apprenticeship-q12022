class Type < ApplicationRecord
  has_many :pokemon_types
  has_many :pokemons, through: :pokemon_types

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :poke_id, presence: true, numericality: { only_integer: true }
end
