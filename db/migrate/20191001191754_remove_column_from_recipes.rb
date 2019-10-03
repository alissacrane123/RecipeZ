class RemoveColumnFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_index :ingredients, :df
    remove_index :ingredients, :gf 
    remove_index :ingredients, :nf
    remove_column :ingredients, :df
    remove_column :ingredients, :gf
    remove_column :ingredients, :nf
  end
end
