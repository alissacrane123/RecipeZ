# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  main       :string           not null
#  vegan      :boolean          default(FALSE)
#  veget      :boolean          default(FALSE)
#  recipe_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  keywords   :text             not null
#  items      :text             default([]), not null, is an Array
#

class Ingredient < ApplicationRecord

  belongs_to :recipe, foreign_key: :recipe_id, class_name: :Recipe
end
