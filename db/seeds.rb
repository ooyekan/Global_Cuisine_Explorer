# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'csv'
require 'faker'
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'net/http'
require 'json'

API_URL = 'https://restcountries.com/v3.1/all'

def fetch_and_save_countries
  uri = URI(API_URL)
  response = Net::HTTP.get(uri)
  countries = JSON.parse(response)

  countries.each do |country_data|
    Country.create(
      name: country_data['name']['common'],
      capital: country_data['capital']&.first || 'Unknown',
      region: country_data['region'],
      subregion: country_data['subregion'],
      population: country_data['population'],
      area: country_data['area'],
      flag_url: country_data['flags']['png']
    )
  end
end

fetch_and_save_countries

# Seed cuisines associated with countries
Country.all.each do |country|
  rand(5..10).times do
    cuisine = Cuisine.new(
      name: Faker::Food.ethnic_category,
      description: Faker::Food.description,
      dish: Faker::Food.dish,
      country: country
    )
    if cuisine.valid?
      cuisine.save
      puts "Created Cuisine: #{cuisine.name} (Country: #{country.name})"
    else
      puts "Failed to create Cuisine: #{cuisine.errors.full_messages.join(', ')}"
    end
  end
end
