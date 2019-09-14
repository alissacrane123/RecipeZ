class AddColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :url_id, :integer, null: false
  end
end
