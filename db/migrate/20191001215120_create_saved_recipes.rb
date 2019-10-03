class CreateSavedRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_recipes do |t|
      t.integer :user_id, null: false 
      t.integer :recipe_id, null: false 
      t.timestamps
    end
    add_index :saved_recipes, [:user_id, :recipe_id], unique: true 
  end
end
