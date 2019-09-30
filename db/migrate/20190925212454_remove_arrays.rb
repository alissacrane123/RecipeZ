class RemoveArrays < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :keywords
    add_column :recipes, :keywords, :text, null: false 
    add_index :recipes, :keywords

    remove_index :ingredients, :words
    remove_column :ingredients, :words 
    add_column :ingredients, :keywords, :text, null: false 
    add_index :ingredients, :keywords
  end
end
