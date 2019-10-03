# == Schema Information
#
# Table name: nutritions
#
#  id          :bigint           not null, primary key
#  name        :string
#  nbd_no      :integer
#  grams       :integer
#  cals        :integer
#  protein     :integer
#  fat         :integer
#  carbs       :integer
#  fiber       :integer
#  sugar       :integer
#  calcium     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  kind        :string
#  description :string
#

class Nutrition < ApplicationRecord
end
