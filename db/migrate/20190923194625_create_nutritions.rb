class CreateNutritions < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritions do |t|
      t.string :name
      t.string :type
      t.text :description, array: true, default: []
      t.integer :nbd_no
      t.integer :grams
      t.integer :cals
      t.integer :protein
      t.integer :fat 
      t.integer :carbs
      t.integer :fiber
      t.integer :sugar
      t.integer :calcium

      t.timestamps
    end
    add_index :nutritions, :name
    add_index :nutritions, :description
  end
end
