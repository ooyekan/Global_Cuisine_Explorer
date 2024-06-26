class Cuisine < ApplicationRecord
  belongs_to :country
  validates :name, presence: true
  validates :description, presence: true
  validates :country_id, presence: true
end
