class Country < ApplicationRecord
  def self.ransackable_associations(auth_object = nil)
    ["country_languages", "cuisines", "languages"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["area", "capital", "created_at", "flag_url", "id", "id_value", "name", "population", "region", "subregion", "updated_at"]
  end
    validates :name, presence: true, uniqueness: true
    validates :capital, presence: true
    validates :region, presence: true
    validates :subregion, presence: true
    validates :population, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :area, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :flag_url, presence: true, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }
    has_many :cuisines, dependent: :destroy
    has_many :country_languages
    has_many :languages, through: :country_languages
    has_many :reviews, dependent: :destroy
  end
