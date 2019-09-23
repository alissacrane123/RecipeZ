# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url_id     :integer          not null
#  directions :text             default([]), is an Array
#  img_src    :string           not null
#  keywords   :text             default([]), is an Array
#  main       :string           not null
#  rating     :integer
#  num_ingred :integer          not null
#  num_dir    :integer          not null
#  time       :integer
#  cal        :integer
#

class Recipe < ApplicationRecord
  validates :title, uniqueness: true, length: { minimum: 5 }
  validates :url_id, :img_src, presence: true, uniqueness: true
  # validates :ingreds, :directions, presence: true, length: { minimum: 1 }
end
