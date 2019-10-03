class ChangeIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :items 
  end
end
