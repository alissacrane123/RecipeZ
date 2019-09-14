class Url < ApplicationRecord
  validates :url, uniqueness: true, length: { minimum: 6 }

  has_one :recipe, :dependent => :destroy
end
