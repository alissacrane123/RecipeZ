# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url_id     :integer          not null
#  ingreds    :text             default([]), is an Array
#  directions :text             default([]), is an Array
#  img_src    :string           not null
#

class Recipe < ApplicationRecord
  validates :title, uniqueness: true, length: { minimum: 5 }
  validates :url_id, presence: true, uniqueness: true
  # validates :ingreds, :directions, presence: true, length: { minimum: 1 }
end
