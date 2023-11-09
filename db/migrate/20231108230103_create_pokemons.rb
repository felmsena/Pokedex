class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :order
      t.integer :base_experience
      t.integer :height
      t.integer :weight
      t.text :types, default: '[]'

      t.timestamps
    end
  end
end
