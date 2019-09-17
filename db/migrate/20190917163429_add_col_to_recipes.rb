class AddColToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :time, :integer
    add_column :recipes, :cal, :integer 
    add_index :recipes, :time 
    add_index :recipes, :cal 
  end
end
