class Language < ApplicationRecord
  def self.ransackable_associations(auth_object = nil)
    ["countries", "country_languages"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "id", "id_value", "name", "updated_at"]
  end
  validates :name, presence: true
  validates :code, presence: true
  has_many :country_languages
  has_many :countries, through: :country_languages
end
