class AddPhotoSrcToUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :img_src, :string, null: false
  end
end
