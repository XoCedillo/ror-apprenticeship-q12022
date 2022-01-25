class CreateAbilityPokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_pokemons do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
