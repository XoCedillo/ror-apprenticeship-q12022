class AddHeightToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :height, :integer
  end
end
