class Cuisine < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["country_id", "created_at", "description", "dish", "id", "id_value", "name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["country"]
  end
  belongs_to :country
  validates :name, presence: true
  validates :description, presence: true
  validates :country_id, presence: true
end
