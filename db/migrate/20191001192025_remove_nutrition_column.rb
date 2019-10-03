class RemoveNutritionColumn < ActiveRecord::Migration[5.2]
  def change
    remove_index :nutritions, :description
    remove_column :nutritions, :description
    add_column :nutritions, :description, :string
    add_index :nutritions, :description
  end
end
