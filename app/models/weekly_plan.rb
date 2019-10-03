# == Schema Information
#
# Table name: weekly_plans
#
#  id         :bigint           not null, primary key
#  month      :string           not null
#  year       :string           not null
#  start_date :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WeeklyPlan < ApplicationRecord
  validates :month, :year, :start_date, :user_id, presence: true 

  belongs_to :user 
  has_many :meals, foreign_key: :weekly_plan_id, class_name: :Meal 
  has_many :recipes, through: :meals, source: :recipe 

end
