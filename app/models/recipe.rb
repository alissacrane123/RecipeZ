class Recipe < ApplicationRecord
  validates :title, uniqueness: true, length: { minimum: 5 }
  validates :url_id, presence: true, uniqueness: true
  validates :ingreds, :directions, presence: true, length: { minimum: 1 }
end
