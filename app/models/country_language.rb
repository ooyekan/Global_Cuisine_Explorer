class CountryLanguage < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["country_id", "created_at", "id", "id_value", "language_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["country", "language"]
  end
  belongs_to :country
  belongs_to :language
end
