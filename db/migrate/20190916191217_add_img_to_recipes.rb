class AddImgToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :img_src, :string, null: false
  end
end
