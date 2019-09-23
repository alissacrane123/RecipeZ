# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  items      :text             default([]), not null, is an Array
#  main       :string           not null
#  df         :boolean          default(FALSE)
#  gf         :boolean          default(FALSE)
#  nf         :boolean          default(FALSE)
#  vegan      :boolean          default(FALSE)
#  veget      :boolean          default(FALSE)
#  recipe_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord

  belongs_to :recipe, foreign_key: :recipe_id, class_name: :Recipe
end
