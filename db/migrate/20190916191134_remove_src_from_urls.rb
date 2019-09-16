class RemoveSrcFromUrls < ActiveRecord::Migration[5.2]
  def change
    remove_column :urls, :img_src, :string
  end
end
