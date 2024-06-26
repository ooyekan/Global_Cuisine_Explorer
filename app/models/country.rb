class Country < ApplicationRecord
    validates :name, presence: true
    validates :capital, presence: true
    validates :region, presence: true
    validates :subregion, presence: true
    validates :population, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :area, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :flag_url, presence: true, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }
    has_many :cuisines, dependent: :destroy
  end
