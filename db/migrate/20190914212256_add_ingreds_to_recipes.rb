class AddIngredsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :ingreds, :text, array: true, default: []

  end
end
