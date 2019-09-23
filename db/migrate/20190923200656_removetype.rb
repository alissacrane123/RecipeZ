class Removetype < ActiveRecord::Migration[5.2]
  def change
    remove_column :nutritions, :type, :string
    add_column :nutritions, :kind, :string
  end
end
