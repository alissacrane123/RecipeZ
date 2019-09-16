class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.text :items, null: false, array: true, default: []
      t.string :main, null: false 
      t.boolean :df, default: false 
      t.boolean :gf, default: false 
      t.boolean :nf, default: false 
      t.boolean :vegan, default: false 
      t.boolean :veget, default: false
      t.integer :recipe_id, null: false  
      t.timestamps
    end
    add_index :ingredients, :recipe_id
    add_index :ingredients, :df
    add_index :ingredients, :gf
    add_index :ingredients, :nf
    add_index :ingredients, :vegan
    add_index :ingredients, :veget
    add_index :ingredients, :main
  end
end
