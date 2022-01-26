class AddWeightToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :weight, :integer
  end
end
