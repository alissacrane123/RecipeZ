class FixRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :ingreds
    add_column :recipes, :keywords, :text, array: true, default: []
    add_column :recipes, :main, :string, null: false
    add_column :recipes, :rating, :integer
    add_column :recipes, :num_ingred, :integer, null: false
    add_column :recipes, :num_dir, :integer, null: false
    add_index :recipes, :num_ingred
    add_index :recipes, :num_dir 
    add_index :recipes, :main
  end

end
