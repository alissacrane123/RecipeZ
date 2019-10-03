# == Schema Information
#
# Table name: saved_recipes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  recipe_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SavedRecipe < ApplicationRecord
  validates :recipe_id, uniqueness: { scope: :user_id }
  validates :recipe_id, :user_id, presence: true 

  belongs_to :user
  belongs_to :recipe 
end
