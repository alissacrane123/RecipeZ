# == Schema Information
#
# Table name: meals
#
#  id             :bigint           not null, primary key
#  weekly_plan_id :integer          not null
#  date           :string           not null
#  recipe_id      :integer          not null
#  grocery_list   :text             default([]), is an Array
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Meal < ApplicationRecord
  validates :weekly_plan_id, :date, :recipe_id, presence: true 
  
  belongs_to :weekly_plan
  belongs_to :recipe 
end
