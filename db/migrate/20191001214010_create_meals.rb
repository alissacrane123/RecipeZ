class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :weekly_plan_id, null: false
      t.string :date, null: false 
      t.integer :recipe_id, null: false 
      t.text :grocery_list, array: true, default: []
      t.timestamps
    end
    add_index :meals, :weekly_plan_id
  end
end
