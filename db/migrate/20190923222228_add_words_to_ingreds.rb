class AddWordsToIngreds < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :words, :text, null: false, array: true, default: []
    add_index :ingredients, :words 
  end
end
