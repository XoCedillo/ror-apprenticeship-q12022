class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.integer :poke_id
      t.string :name
      t.string :url
      t.string :sprite

      t.timestamps
    end
  end
end
