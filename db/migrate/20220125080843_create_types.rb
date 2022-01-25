class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.integer :poke_id
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
