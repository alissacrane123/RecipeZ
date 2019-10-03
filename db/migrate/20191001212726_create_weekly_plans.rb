class CreateWeeklyPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_plans do |t|
      t.string :month, null: false 
      t.string :year, null: false 
      t.string :start_date, null: false
      t.integer :user_id, null: false 
      t.timestamps
    end
    add_index :weekly_plans, :user_id
    add_index :weekly_plans, :start_date 
  end
end
