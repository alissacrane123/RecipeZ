class AddItemsBack < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :items, :text, null: false, array: true, default: []
    
  end
end
