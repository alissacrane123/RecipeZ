# == Schema Information
#
# Table name: urls
#
#  id         :bigint           not null, primary key
#  url        :string           not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Url < ApplicationRecord
  validates :url, uniqueness: true, length: { minimum: 6 }

  has_one :recipe, :dependent => :destroy
end
