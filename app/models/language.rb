class Language < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  has_many :country_languages
  has_many :countries, through: :country_languages
end
